module "mysql_sg"{
    #source="../terraform-aws-sg"
    source="git::https://github.com/HariniUddagiri/Terraform_latest_2026.git//terraform-aws-sg?ref=main"
    vpc_id=local.vpcid_final
    sg_name="mysql"
    sg_description="security group for mysql component of expense-dev"
    project=var.project
    environment=var.environment
    common_tags=var.common_tags
}

module "backend_sg"{
    #source="../terraform-aws-sg"
    source="git::https://github.com/HariniUddagiri/Terraform_latest_2026.git//terraform-aws-sg?ref=main"
    vpc_id=local.vpcid_final
    sg_name="backend"
    sg_description="security group for backend component of expense-dev"
    project=var.project
    environment=var.environment
    common_tags=var.common_tags
}

module "frontend_sg"{
    #source="../terraform-aws-sg"
    source="git::https://github.com/HariniUddagiri/Terraform_latest_2026.git//terraform-aws-sg?ref=main"
    vpc_id=local.vpcid_final
    sg_name="frontend"
    sg_description="security group for frontend component of expense-dev"
    project=var.project
    environment=var.environment
    common_tags=var.common_tags
}

module "bastian_sg"{
    #source="../terraform-aws-sg"
    source="git::https://github.com/HariniUddagiri/Terraform_latest_2026.git//terraform-aws-sg?ref=main"
    vpc_id=local.vpcid_final
    sg_name="bastian"
    sg_description="security group for bastian component of expense-dev"
    project=var.project
    environment=var.environment
    common_tags=var.common_tags

}

module "app_alb_sg"{
    #source="../terraform-aws-sg"
    source="git::https://github.com/HariniUddagiri/Terraform_latest_2026.git//terraform-aws-sg?ref=main"
    vpc_id=local.vpcid_final
    sg_name="app_alb_sg"
    sg_description="security group for app load balancer of backend expense-dev"
    project=var.project
    environment=var.environment
    common_tags=var.common_tags

}