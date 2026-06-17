resource "aws_instance" "this"{
    ami="ami-00adafae70b8029d8"
    instance_type=lookup(var.instance_type,terraform.workspace,"t3.small")
    vpc_security_group_ids=[]
    tags={
        name="expense-${terraform.workspace}"
    }
}

resource "aws_security_group" "allow_tls"{
    name="allow_all-${terraform.workspace}"

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

    tags={
        name="expense-${terraform.workspace}"
    }
}