module "frontend"{
  source = "./aws_instances"
  cmds=["touch front1.dat","touch front2.dat"]
}
module "backend"{
  cmds=["touch back1.dat","touch back2.dat"]
  total_instances=2
  source = "./aws_instances"
  region="sa-east-1"
}


output "backend_ips"{
  value=module.backend.ips
}
output "front_end_ips"{
  value=module.frontend.ips
}