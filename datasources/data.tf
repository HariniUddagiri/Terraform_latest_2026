data "aws_ami" "devops" {
  filter {
    name   = "image-id"
    values = ["ami-0fdfb4d987b63ae72"]
  }
}
data "aws_vpc" "default" {
  default = true
}

output  "ami_id" {
  value       = data.aws_ami.devops.id
}

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}

