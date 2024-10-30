
resource "aws_instance" "example" {
  ami           = var.ami # Amazon Linux 2 AMI
  instance_type = var.instance_type

  tags = {
    Name = "ExampleEC2Instance"
    environment= "log"
  }
}
