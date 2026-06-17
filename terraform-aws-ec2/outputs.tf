output "public"{
    value=aws_instance.this.public_ip
}

output "private"{
    value=aws_instance.this.private_ip
}