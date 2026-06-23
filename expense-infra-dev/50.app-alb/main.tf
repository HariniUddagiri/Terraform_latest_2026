module "alb" {
  source = "terraform-aws-modules/alb/aws" #open source module
  internal=true #telling alb shud be internal i.ee private that will be used for private/ db subnets

  name    = "${var.project}-${var.environment}-app-alb"
  vpc_id  = data.aws_ssm_parameter.vpcid.value
  create_security_group = false #we don't need from open source module, we are creating security grp as per our usage
  subnets = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  security_groups=[data.aws_ssm_parameter.sg_id-app_alb.value]
  enable_deletion_protection = false
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project}-${var.environment}-app-alb"
    }
  )
}

resource "aws_alb_listener" "http"{
    load_balancer_arn=module.alb.arn
    protocol="HTTP"
    port=80

    default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I am from backend APP ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "app_alb" {
  zone_id = var.zone_id
  name    = "*.app-dev.${var.domain_name}"
  type    = "A"

  # these are ALB DNS name and zone information--created alias name for alb dns name using route 53  and giving alb dns & zone id whwre it exists as a target to route 53, so that r53 will send requests to alb 
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = false
  }
}



