resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id
  availability_zone = var.az1
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-public-subnet-1"
  }
}

resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id
  availability_zone = var.az2
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-public-subnet-2"
  }
}
