resource "aws_vpc" "this"{
    cidr_block=var.cidr_block
    enable_dns_hostnames=var.enable_dns_hostnames
    instance_tenancy="default"
    tags=merge(
        var.common_tags,
        var.vpc_tags,
        {
            Name=local.resource_name
        }

    )
        
}

resource "aws_internet_gateway" "igw"{
    vpc_id=aws_vpc.this.id
    tags=merge(
        var.common_tags,
        var.vpc_tags,
        {
            Name=local.resource_name
        }

    )
}

resource "aws_subnet" "public"{
    count=length(var.public_subnet_cidrs)
    cidr_block=var.public_subnet_cidrs[count.index]
    vpc_id=aws_vpc.this.id
    availability_zone=local.azs[count.index]
    map_public_ip_on_launch=true

    tags=merge(
        var.common_tags,
        var.public_subnet_tags,
        {
            Name="${local.resource_name}-public-${local.azs[count.index]}"
        }
    )
}

resource "aws_subnet" "private"{
    count=length(var.private_subnet_cidrs)
    cidr_block=var.private_subnet_cidrs[count.index]
    vpc_id=aws_vpc.this.id
    availability_zone=local.azs[count.index]

    tags=merge(
        var.common_tags,
        var.public_subnet_tags,
        {
            Name="${local.resource_name}-private-${local.azs[count.index]}"
        }

    )

}

resource "aws_subnet" "database"{
    count=length(var.database_subnet_cidrs)
    cidr_block=var.database_subnet_cidrs[count.index]
    vpc_id=aws_vpc.this.id
    availability_zone=local.azs[count.index]

    tags=merge(
        var.common_tags,
        var.database_subnet_tags,
        {
            Name="${local.resource_name}-database-${local.azs[count.index]}"
        }

    )

}

resource "aws_eip" "eip"{
    domain="vpc"
}

resource "aws_nat_gateway" "nat"{
    allocation_id=aws_eip.eip.id
    subnet_id=aws_subnet.public[0].id
    tags=merge(
        var.common_tags,
        var.nat_tags,
        {
            Name="${local.resource_name}-nat"
        }
    )
    depends_on=[aws_internet_gateway.igw]


}

#Create route tables----

resource "aws_route_table" "public"{
    vpc_id=aws_vpc.this.id
    tags = merge(
    var.common_tags,
    var.public_route_table_tags,
    {
      Name = "${local.resource_name}-public"
    }
  )
}

resource "aws_route_table" "private"{
    vpc_id=aws_vpc.this.id
     tags = merge(
    var.common_tags,
    var.private_route_table_tags,
    {
      Name = "${local.resource_name}-private"
    }
  )
}

resource "aws_route_table" "database"{
    vpc_id=aws_vpc.this.id
     tags = merge(
    var.common_tags,
    var.database_route_table_tags,
    {
      Name = "${local.resource_name}-database"
    }
  )
}

#--edit routes step--

resource "aws_route" "public_route"{
    route_table_id=aws_route_table.public.id
    destination_cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.igw.id

}

resource "aws_route" "private_route"{
    route_table_id=aws_route_table.private.id
    destination_cidr_block="0.0.0.0/0"
    gateway_id=aws_nat_gateway.nat.id
}

resource "aws_route" "database_route"{
    route_table_id=aws_route_table.database.id
    destination_cidr_block="0.0.0.0/0"
    gateway_id=aws_nat_gateway.nat.id
}

#--subnets association with route table step

resource "aws_route_table_association" "public"{
    count=length(var.public_subnet_cidrs)
    route_table_id=aws_route_table.public.id
    subnet_id=aws_subnet.public[count.index].id
}

resource "aws_route_table_association" "private"{
    count=length(var.private_subnet_cidrs)
    route_table_id=aws_route_table.private.id
    subnet_id=aws_subnet.private[count.index].id
}

resource "aws_route_table_association" "database"{
    count=length(var.database_subnet_cidrs)
    route_table_id=aws_route_table.database.id
    subnet_id=aws_subnet.database[count.index].id
}

resource "aws_db_subnet_group" "expense"{ #telling terraform in which subnets, DB instances shud be deployed WHEN RDS CREATS DB instance 
    name="${var.project}-${var.environment}"
    subnet_ids=aws_subnet.database[*].id
    tags=merge(
        var.common_tags,{
            Name="${var.project}-${var.environment}"
        }
        
    )
}