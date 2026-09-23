resource "aws_instance" "terraform-demo" {
  ami           =  "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
   ##  default vpc
  tags = {
    Name = "terraform-demo"
    project= "roboshop"
    environemnt= "dev"
  }
}

resource "aws_security_group" "terraform-demo" {
  name        = "terraform-demo-1"
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
    Name = "terraform-demo-1"
    project= "roboshop"
    environemnt= "dev"
  }
}
