resource "aws_instance" "terraform-demo" {
  ami           = var.ami_id
  instance_type = var.instance_type == "dev" ? "t3.micro":"t3.small"
  
vpc_security_group_ids = [aws_security_group.terraform-vinay.id]  

  tags =  var.ec2_tags

}

resource "aws_security_group" "terraform-vinay" {
  name        = "var.sg_names"
  description = "Allow TLS inbound traffic and all outbound traffic"
 
egress {
         from_port   = var.port
         to_port     = var.port
         protocol    = "-1"
         cidr_blocks = var.cidr
}

  tags = var.sg_tags

}