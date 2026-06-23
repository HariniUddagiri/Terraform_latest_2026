data "aws_ssm_parameter" "vpcid"{
    name="/${var.project}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_ids"{
    name="/${var.project}/${var.environment}/private_subnet_ids"

}

data "aws_ssm_parameter" "sg_id-app_alb"{
    name="/${var.project}/${var.environment}/app_alb_sg_id"
}