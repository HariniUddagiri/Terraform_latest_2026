terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
            version="~>6.0"
        }
    }

    backend "s3"{
        bucket="forsure-devops"
        key="ec2-example" # you should have unique keys with in the bucket, same key should not be used in other repos or tf projects
        dynamodb_table="forsure-table"
        region="us-east-1"
    }
}



provider "aws"{
    region="us-east-1"
}