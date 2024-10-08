

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  
}

resource "aws_vpc" "firstvpc" {

    cidr_block = "10.10.0.0/16"
  tags = {
    name = "myfirstvpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.firstvpc.id
  cidr_block = "10.10.1.0/24"
}
output "routtableID" {
    value = aws_vpc.firstvpc.main_route_table_id
  
}