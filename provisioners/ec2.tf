resource "aws_instance" "this"{
    ami="ami-00adafae70b8029d8"
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    instance_type="t3.small"
    tags={
        name="expense-backend-service"
    }

    provisioner "local-exec"{
        command="echo ${self.private_ip}>inventory"
    }

    connection{
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
    }

    provisioner "remote-exec"{
        inline = [ #inline is used when you want to execute one or more shell commands directly within your Terraform configuration.
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
    }

    provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
    ]
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
    
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
     egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }

    tags={
        name="expense-backend-service"
    }

}

