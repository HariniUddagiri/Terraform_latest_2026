resource "aws_instance" "bastian"{
    ami=data.aws_ami.joindevops.id
    instance_type="t3.micro"
    vpc_security_group_ids=[data.aws_ssm_parameter.sg_id_bastian.value]
    subnet_id=local.subnet_id
    tags=merge(
        var.common_tags,
        {
            name="${var.project}-${var.environment}-bastian"
        }
    )
}
