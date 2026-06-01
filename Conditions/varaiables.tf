variable "ami_id"{
    type=string
    default="ami-0fdfb4d987b63ae72"
}

variable ec2_tags{
    type=map
    default={
        project="Expense"
        Environment="prod"
        component="backend"
        Name="expense-backend-prod"

    }
}

variable in_from{
    type=number
    default=22
}

variable in_to{
    type=number
    default=22
}

variable in_prot{
    type=string
    default="TCP"
}

variable cidr{
    type=list(string)
    default=["0.0.0.0/0"]
}

variable out_from{
    type=number
    default=0
}

variable out_to{
    type=number
    default=0
}

variable out_prot{
    type=string
    default="-1"
}

variable sg_tags{
    type=map
    default={
        name="expense-backend-prod"
    }
}

variable "environment"{
    type=string
    default="dev"
}