variable "project"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"        
}

variable "instance_type" {
    default = "t3.micro"           ##  its easily  override
}                    

#variable "name" {
  #  default = "${var.project}-${var.environemnt}" ## it give  out put error 
    ## beacause override the variable
#}