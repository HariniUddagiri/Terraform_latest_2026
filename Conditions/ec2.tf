resource "aws_instance" "this"{
    ami=var.ami_id
    instance_type=var.environment=="prod"?"t3.micro":"t3.small"
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    tags=var.ec2_tags
}

resource "aws_security_group" "allow_tls"{

    name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress{
    from_port=var.in_from
    to_port=var.in_to
    protocol=var.in_prot
    cidr_blocks=var.cidr
  }

  egress{
    from_port=var.out_from
    to_port=var.in_from
    protocol=var.in_prot
    cidr_blocks=var.cidr
  }
tags=var.sg_tags
}