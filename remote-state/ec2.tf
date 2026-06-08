resource "aws_instance" "example" {
    ami="ami-0fdfb4d987b63ae72"
    instance_type="t3.micro"
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    tags={
        name="expense-backend-dev"
    }
}

resource "aws_security_group" "allow_tls"{
    name="allow_tls"
    description="allow ssh port"
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
