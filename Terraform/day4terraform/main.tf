provider "aws" {

  
}



resource "aws_instance" "myec2" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t3.micro"

}