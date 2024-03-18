resource "aws_instance" "new" {
  ami = "ami-013168dc3850ef002"
  instance_type = "t2.micro"
  key_name = "mykey"
  tags = {
    Name = "new"
  }
}