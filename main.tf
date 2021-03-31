provider "aws" {
    region = "eu-west-2"
}

resource  "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
  tags = {
    Name = "development-vpc"
  }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "eu-west-2a"
  tags = {
    Name = "dev-subnet-1"
  }
}

data "aws_vpc" "existing-dev-vpc" {
  tags = {
    Name = "development-vpc"
  }
}

resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing-dev-vpc.id
    cidr_block = "10.0.20.0/24"
    availability_zone = "eu-west-2a"
  tags = {
    Name = "dev-subnet-2"
  }
}