variable "instance_type" {
  type        = string
  description = "The size of the EC2 instance"
  default     = "t3.micro"
validation {
    # Ensures the input matches one of the allowed instance types
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Allowed instance types are limited to: t3.micro, t3.small, or t3.medium."
  }

}

variable "ami_id" {
    type = string
    default ="ami-0220d79f3f480ecf5"
}


variable "terraform-new" {
    type = string
    default = "terraform-new" 
}

variable "project" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "port" {
    type = number
    default = 0  
}

variable "cidr_block" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
 type = map
 default = {
 Name = "terraform-new"
 project = "roboshop"     
 environemnt= "dev"

 }
 }

variable "instances" {
    type = list
    default = [ "mongodb","redis", "frontend","rabbitmq" ]

}

variable "zone_id" {
    type = string
    default = "Z04820742MSQA0TX8Y2UC"
}
variable "domain_name" {
    type = string
    default = "daws-90s.shop"
}