resource "aws_route53_record" "this"{
    count=length(var.instances)
    zone_id=var.zone_id
    name=var.instances[count.index]=="frontend" && var.environment=="prod"?var.domain_name:"${var.instances[count.index]}-${var.environment}"
    records=[var.instances[count.index]=="frontend" && var.environment=="prod"?aws_instance.this[count.index].public_ip:aws_instance.this[count.index].private_ip]
    ttl=1
    type="A"
    allow_overwrite=true
}