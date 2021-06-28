
variable "total_instances" {
  default=1
}

variable "cmds"{
  type    = list
  default = ["touch test.dat"]
}

