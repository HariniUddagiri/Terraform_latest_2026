variable "project" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "domain_name" {
    default="hariram.online"
}

variable "zone_id" {
    default = "Z08477602OZXUN3D16B7V"
}