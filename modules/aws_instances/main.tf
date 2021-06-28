resource "aws_security_group" "nginx" {
  name        = "nginx_firewall-jkidd"
  description = "Firewall for the nginx-server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "bubba" {
  key_name   = "bubba"
  public_key = file("./bubba.pub")
}
resource "aws_instance" "instance"{
  count = var.total_instances
  ami   = data.aws_ami.ubuntu.id
  key_name = aws_key_pair.bubba.key_name
  instance_type = "t2.micro"
  
  security_groups = [aws_security_group.nginx.name]
  availability_zone=data.aws_availability_zones.available.names[count.index]
  provisioner "remote-exec" {
     inline = var.cmds
     connection{
       host     = self.public_ip
       type     = "ssh"
       user     = "ubuntu"
       private_key = file("/home/ec2-user/environment/bubba")
     }
   }
}