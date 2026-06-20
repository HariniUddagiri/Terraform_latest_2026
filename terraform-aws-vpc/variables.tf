variable "cidr_block"{

}

variable "enable_dns_hostnames"{
    default=true
}

variable "common_tags"{
    
}

variable "vpc_tags"{
    
}

variable "project"{

}

variable "environment"{

}

variable "public_subnet_cidrs"{
    type= list
    validation{
    condition=length(var.public_subnet_cidrs)==2
    error_message="please provide 2 valid subnet CIDR"
    }
}

variable "public_subnet_tags"{
    default={}
}

variable "private_subnet_cidrs"{
    type=list
    validation{
    condition=length(var.private_subnet_cidrs)==2
    error_message="please provide 2 valid subnet CIDR"
    }
}

variable "private_subnet_tags"{
    default={}
}

variable "database_subnet_cidrs"{
    type=list
    validation{
    condition=length(var.database_subnet_cidrs)==2
    error_message="please provide 2 valid subnet CIDR"
    }
}

variable "database_subnet_tags"{
    default={}
}

variable "public_route_table_tags" {
    default={}
}

variable "private_route_table_tags" {
    default={}
}

variable "database_route_table_tags" {
    default={}
}

variable "nat_tags"{
    default={}
}

variable "is_peering_required" {
    default=false
}

variable "peering_tags"{
    default={}
}