resource "aws_instance" "abhi1" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.abhi.id
    security_groups = [data.aws_security_group.abhi.id]
  tags = {
    Name = "datasource"
  }
}


data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

