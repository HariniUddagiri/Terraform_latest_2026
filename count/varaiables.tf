variable "ami_id"{
    type=string
    default="ami-0fdfb4d987b63ae72"
}

variable instances{
    type=list(string)
    default=["mysql","backend","frontend"]
}

variable common_tags{
    type=map
    default={
        project="Expense"
        Environment="prod"   

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
        name="allow_tls"
    }
}

variable domainname{
    default="hariram.online"
}

variable "zone_id" {
    default = "Z00044205Q62ULDJK28F"
}

