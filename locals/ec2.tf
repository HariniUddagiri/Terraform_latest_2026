resource "aws_instance" example{
    ami=local.ami_id
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    instance_type=local.instance_type
    tags={
        name=local.name
    }
}

resource "aws_security_group" allow_tls{
    name="allow_tls"
    description="allow SSH"
    ingress{
        from_port=22
        to_port=22
        protocol="TCP"
        cidr_blocks=["0.0.0.0/0"]
    }

    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags={
        name=local.name
    }
}
