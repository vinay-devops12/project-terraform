locals {
  name = "${var.project}-${var.environment}" 
  ami =  data.aws_ami.joindevops.id
  instance_type = var.instance_type
}                                         

## if use the locals easily reuse any time