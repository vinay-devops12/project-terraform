variable "instance_type" {
  type        = string
  description = "The size of the EC2 instance"
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }
}

variable "environment" {
  type        = string
  description = "The size of the EC2 instance"
  default     = "dev"   ##production gives  t3.small
                        #dev gives t3.micr
}



variable "ami_id" {
 type = string
 default = "ami-0220d79f3f480ecf5"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name = "terraform-demo"
    project = "roboshop"
    environment = "dev" 
  }
}

variable "sg_names" {
type = string
default = "terraform-vinay"
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name = "terraform-demo"
    project = "roboshop"
    environment = "dev" 
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
