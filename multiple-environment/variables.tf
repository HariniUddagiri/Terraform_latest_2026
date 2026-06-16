variable "instances"{
    default=["mysql","backend","frontend"]
}

variable "common_tags"{
    default={
        project="expense"
        terraform="true"
    }
}

variable "project"{
    default="expense"
}

variable "environment"{
    default="prod"
}

variable "domain_name"{
    default="hariram.online"

}

variable "zone_id" {
    default = "Z020029837Q3CLJC3H8NM"
}
