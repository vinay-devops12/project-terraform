resource "aws_instance" "terraform-new" {
 #count = length(var.instances)
  for_each = var.instances
  ami           = var.ami_id
  instance_type = each.value.instance_type
    vpc_security_group_ids = [
         aws_security_group.terraform-new[each.key].id,
        aws_security_group.common.id
    ] # list

 tags = { 
  Name = "${var.project}-${var.environment}-${each.key}"
}  ##
 ## roboshop-dev-mongodb...etc
 
}




resource "aws_security_group" "terraform-new" {
 #count = length(var.instances)
  for_each = var.instances
  name        = "$(var.project)-$(var.environemnt)-${each.key}.id"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
 tags = { 
  Name = "${var.project}-${var.environment}-${each.key}"
}
  ## ecch.key represent the instaces....

 egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
  }
 
}


resource "aws_security_group" "common" {
  name        = "$(var.project)-$(var.environemnt)-common"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
tags ={
    Name = "$(var.project)-$(var.environemnt)-common"
  }

 egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
  }
 
}



### for-loop function used for incase you need instance type t3.micro.t3.small.t3.medium
#etc.... then for_each loop will be used