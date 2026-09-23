variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "rhel vinay devops"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "t3.micro"
}

variable "ec2_tags" {
   type = map 
   default= {
   name = "terraform-demo"
   project= "roboshop"
   environment= "dev"
}
}

variable "sg_names" {
 type = string
 default   = "terraform-demo-1"
 description = "security_groups"
}


variable "sg_tags" {
   type = map 
   default= {
   name = "terraform-demo-1"
   project= "roboshop"
   environment= "dev"
}
}

variable "port" {
type = number
default = 0

}

variable "cidr" {
type = list(string)
default =  ["0.0.0.0/0"]

}

