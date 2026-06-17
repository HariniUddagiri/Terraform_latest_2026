resource "aws_instance" "this"{
    ami="ami-00adafae70b8029d8"
    instance_type=var.instance_type
    vpc_security_group_ids=[var.sg_id]
    tags=var.ec2_tags
    
}



