data "aws_ec2_instance_type" "example" {
  instance_type = "t2.micro"
}

output "aws_ec2_instance_type" {
  value = {
    Id= data.aws_ec2_instance_type.example.id,
    Hypervisor = data.aws_ec2_instance_type.example.id}

}