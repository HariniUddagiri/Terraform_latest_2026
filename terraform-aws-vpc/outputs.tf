/*output "az_info"{
    value=data.aws_availability_zones.az
}*/

output "vpc_id"{
    value=aws_vpc.this.id
}

output "public_subnet_id"{
    value=aws_subnet.public[*].id

}

output "private_subnet_id"{
    value=aws_subnet.private[*].id

}

output "database_subnet_id"{
    value=aws_subnet.database[*].id

}

output "database_subnet_group_name"{
    value=aws_db_subnet_group.expense.name
}