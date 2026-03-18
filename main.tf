provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./module/vpc"
  cidr_block = "192.168.0.0/16"
}

module "ec2" {
  source = "./module/ec2"
  instance_type = "t2.micro"
  ami = "ami-06c643a49c853da56"
  subnet_id = module.vpc.public_subnet_id  # public_subnet_id is a output of VPC module output.tf. Output of VPC module is the input here
}

module "s3" {
  source = "./module/s3"
  bucket_name = "my-demo-bucket-bkt-tarund"  # unique name
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}
