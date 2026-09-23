resource "aws_instance" "terraform-demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = var.ec2_tags
   
}

resource "aws_security_group" "terraform-demo" {
  name        = var.sg_names
  description = "Allow TLS inbound traffic and all outbound traffic"

## outbound traffic
  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

## lebels meta data etc...
  tags =var.sg_tags

}
