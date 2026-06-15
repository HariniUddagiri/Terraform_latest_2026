resource "aws_instance" "this"{
    ami="ami-0fdfb4d987b63ae72"
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    for_each=var.instances
    instance_type=each.value
    tags={
        name=each.key
    }
}

resource "aws_security_group" "allow_tls"{
    name="allow_tls"

    ingress{
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }

}
