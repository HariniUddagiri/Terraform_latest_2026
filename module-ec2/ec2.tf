module "ec2"{
    source="../terraform-aws-ec2"
    instance_type="t3.micro"
    sg_id="sg-0f3ca2eb6b88214d8"
}