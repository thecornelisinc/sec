# Security Issue 1: Unencrypted S3 Bucket
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "example-unencrypted-bucket"

  # No encryption block, which is a security risk
}

# Security Issue 2: Open Security Group
resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Security group with open ingress rules"

  # Ingress rule allows all traffic from the internet
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule also allows all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Issue 3: Public EC2 Instance without IAM Role
resource "aws_instance" "public_instance" {
  ami           = "ami-12345678" # Replace with a real AMI ID
  instance_type = "t2.micro"
  
  # Associating this instance with the insecure security group
  vpc_security_group_ids = [aws_security_group.insecure_sg.id]

  # Security issue: No IAM role for the instance
  associate_public_ip_address = true  # Public IP makes it accessible from the internet

  tags = {
    Name = "InsecureInstance1"
  }
}








