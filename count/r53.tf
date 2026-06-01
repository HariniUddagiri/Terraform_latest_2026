resource "aws_route53_record" "expense_route"{
    count=length(var.instances)
    zone_id=var.zone_id
    name="${var.instances[count.index]}.${var.domainname}" #interpolation-concating variables with text
    records=[aws_instance.this[count.index].private_ip]
    type="A"
    ttl=1
    allow_overwrite=true #if same type or same record exists, it overwrites instead of failing, 
    #here we need privateip for mysql, backend servers, for front end, we need public ip that we are writing below
    #so, even the r53 records are created for 3 servers with private ip, we don't need fromt end private ip recors, that will be
    #overwritten by below frontend publickp r53 record
}

resource "aws_route53_record" "frontend"{
zone_id=var.zone_id
name=var.domainname
records=[aws_instance.this[2].public_ip]
type="A"
ttl=1
allow_overwrite=true
}