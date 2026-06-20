module "sg"{
    source="../terraform-aws-sg"
    vpc_id=local.vpcid_final
    sg_name="mysql"
    sg_description="security group for mysql component"
    project=var.project
    environment=var.environment
    common_tags=var.common_tags
}