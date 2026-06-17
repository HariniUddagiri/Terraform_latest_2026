resource "aws_instance" "this"{
    count=length(var.instances)
    ami="ami-0fdfb4d987b63ae72"
    vpc_security_group_ids=[aws_security_group.allow_tls.id]
    instance_type="t3.small"
    tags=merge(var.common_tags,
        {
            name="${var.project}-${var.environment}-${var.instances[count.index]}"
        })

    }


resource "aws_security_group" "allow_tls"{
    name="${var.project}-${var.environment}"
    description="allow inbpund ad outbound rules of llo tls"

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
        name="${var.project}-${var.environment}"
    }
}