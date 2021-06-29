module "frontend"{
  source = "./aws_instances"
  cmds=["touch front1.dat","touch front2.dat"]
}
module "backend"{
  cmds=["sudo apt update","sudo apt install nginx -y"]
  total_instances=0
  source = "./aws_instances"
  providers = {
    aws = aws.saeast1
  }
}


output "backend_ips"{
  value=module.backend.ips
}
output "front_end_ips"{
  value=module.frontend.ips
}