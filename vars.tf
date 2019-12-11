variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION" {

default = "eu-west-1"
}

variable "WIN_AMIS"{
type ="map"
default = {
us-west-1 = " "
us-west-2 = " "
eu-west-1 = "ami-from aws"
}
}

variable "PATH-TO-PRIVATE-KEY"{

default ="mykey"

}
variable "PATH-TO-PUBLIC-KEY"{

default ="mykey.pub"

}

variable "INSTANCE_USERNAME"{

default ="Terraform"

}
variable "INSTANCE_PASSWORD"{
}