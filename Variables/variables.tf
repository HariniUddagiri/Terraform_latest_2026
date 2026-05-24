variable "ami_id"{
    type=string
    default ="ami-0fdfb4d987b63ae72"
    description = "This is RHEL9 AMI ID"
}

variable "instance_type"{
    type=string
    #default="t3.micro"

}

variable "ec2_tags"{
    type=map
    default={
        project = "expense"
        Component="backend"
        environment="dev"
        Name="expense-backend-dev"
    }
}

variable "from_port"{
    type=number
    default=22
}

variable "to_port"{
    type=number
    default=22
}

variable "cidr_blocks"{
    type = list (string)
    default=["0.0.0.0/0"]

}

variable "sg_tags"{
    type=map
    default={
        Name="expense-backend-dev"
    }
}

