resource "aws_instance" "terraform-demo" {
   ami = local.ami
  instance_type = local.instance_type
   ##  default vpc
  tags = {
    Name = local.name
}

}

resource "aws_security_group" "terraform-demo" {
  name        = "${local.name}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

## outbound traffic

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]   
  }

## lebels meta data etc...
  tags = {
    Name =  local.name
   
  }
}
