# Initialize the AWS provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5R2VXLKZCJ3DOPX3"
  secret_key = "ShPAPX1TZdO61PK5XC3zRCvmfZhngsWpKQU4+6Tn"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet"
  }
}