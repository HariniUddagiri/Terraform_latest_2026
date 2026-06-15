resource "aws_instance" "this"{
    ami="ami-0fdfb4d987b63ae72"
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    instance_type="t3.micro"
    tags={
        name="expense"
        component="backend"
        environment="dev"
    }

}

resource "aws_security_group" "allow_tls"{
    name="allow_tls"

    dynamic "ingress"{
        for_each=var.ingress_blocks
        content{
        from_port=ingress.value["from_port"] # we are getting value of from_port as it is key value pair (refer variables)
        to_port=ingress.value["to_port"]
        protocol=ingress.value["protocol"]
        cidr_blocks=ingress.value["cidr_blocks"]
        }
    }

    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }

    tags={
          name="expense"
        component="backend"
        environment="dev"
    }


}
