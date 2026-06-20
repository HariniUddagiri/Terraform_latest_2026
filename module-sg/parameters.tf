resource "aws_ssm_parameter" "sg_id_mysql"{
    name="$/${var.project}/${var.environment}/sg_id"
    type="String"
    value=module.sg.sg_id

}
