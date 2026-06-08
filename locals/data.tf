data "aws_ami" "this"{
    filter{
        name="image-id"
        values=["ami-0fdfb4d987b63ae72"]
    }
}
data "aws_vpc" "default"{
    default=true
}
