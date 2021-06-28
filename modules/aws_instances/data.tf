data "aws_availability_zones" "available"{
    state="available"
    filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
    
  }
  exclude_names = ["sa-east-1a"]
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}