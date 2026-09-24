resource "aws_instance" "terraform-new" {
 count = length(var.instances)
  ami           = var.ami_id
  instance_type = var.instance_type
    vpc_security_group_ids = [
        aws_security_group.terraform-new[count.index].id,
        aws_security_group.common.id
    ] # list

  tags = { 
  name = "$(var.project)-$(var.environemnt)-${var.instances[count.index]}"
}

}


resource "aws_security_group" "terraform-new" {
 count = length(var.instances)
  name        = "$(var.project)-$(var.environemnt)-${var.instances[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
 tags ={
    name = "$(var.project)-$(var.environemnt)-${var.instances[count.index]}"
  }
  

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
    name = "$(var.project)-$(var.environemnt)-common"
  }

 egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
  }
 
}


 resource "aws_route53_record" "terraform-new" {
  count           = length(var.instances)
  zone_id         = var.zone_id
  name            = "${var.instances[count.index]}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [aws_instance.terraform-new[count.index].private_ip]
  allow_overwrite = true
}


resource "aws_route53_record" "frontend" {
  zone_id         = var.zone_id
  name            = "${var.project}.${var.domain_name}"   # roboshop.daws-90s.shop
  type            = "A"
  ttl             = 1
  records         = [aws_instance.terraform-new[index(var.instances, "frontend")].public_ip]
  allow_overwrite = true
}
