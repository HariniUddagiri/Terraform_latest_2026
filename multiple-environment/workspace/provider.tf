terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
            version="~>6.0"
          
        }
    }


backend "s3"{
    bucket="hariram-workspace-demo"
    key="hariram-terraform-workspace-demo"
    #dynamodb_table="hariram-workspace-table"
    use_lockfile = true
    region="us-east-1"
}
}

provider "aws"{
    region="us-east-1"
}