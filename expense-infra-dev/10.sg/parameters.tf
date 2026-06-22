resource "aws_ssm_parameter" "sg_id_mysql"{
    name="$/${var.project}/${var.environment}/mysql_sg_id"
    type="String"
    value=module.mysql_sg.sg_id

}

resource "aws_ssm_parameter" "sg_id_backend"{
    name="$/${var.project}/${var.environment}/backend_sg_id"
    type="String"
    value=module.backend_sg.sg_id

}

resource "aws_ssm_parameter" "sg_id_frontend"{
    name="$/${var.project}/${var.environment}/frontend_sg_id"
    type="String"
    value=module.frontend_sg.sg_id

}

resource "aws_ssm_parameter" "sg_id_bastian"{
    name="$/${var.project}/${var.environment}/bastian_sg_id"
    type="String"
    value=module.bastian_sg.sg_id

}


