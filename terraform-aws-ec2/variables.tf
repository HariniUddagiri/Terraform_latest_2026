# mandatory
variable "sg_id" {

}

variable "instance_type" {
    default = "t3.micro"
    validation {
        condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type) #enforce best standard & practices
        error_message = "Valid values for instance type are: t3.small t3.medium t3.micro"
    } 
}

# optional as we gave default word
variable "ec2_tags" {
    default = {}
}