resource "aws_vpc" "abhi" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "abhi"
    }

}
resource "aws_internet_gateway" "abhi" {
    vpc_id = aws_vpc.abhi.id
    tags = {
      Name = "abhi"
    }
  
}
resource "aws_subnet" "abhi" {
  vpc_id = aws_vpc.abhi.id
  #availability_zone = "ap-south-1a"
  cidr_block = "10.0.0.0/20"
  tags = {
      Name = "abhi"
    }

}
resource "aws_route_table" "abhi" {
    vpc_id = aws_vpc.abhi.id
    tags = {
      Name = "abhi"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.abhi.id
      
    }

}
resource "aws_route_table_association" "abhi" {
    route_table_id = aws_route_table.abhi.id
    subnet_id = aws_subnet.abhi.id
  
}
resource "aws_instance" "abhi" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    #availability_zone = "ap-south-1a"
    subnet_id = aws_subnet.abhi.id
    associate_public_ip_address = true
    key_name = "mykey"
    tags = {
      Name = "abhi"
    }
  
}

#security group
resource "aws_security_group" "abhi" {
  tags = {
    Name = "abhi"
  }
  vpc_id = aws_vpc.abhi.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
