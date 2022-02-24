provider "aws" {
  region = "eu-west-2"
}
##################################################################
variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string) # string,number or boolean
  default = ["value1","value2"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

# input vars
variable "inputname" {
  type = string
  description = "set the name of the vpc"
}

##################################################################

resource "aws_vpc" "myvpc1" {
  cidr_block = "10.0.0.0/16"
  # we define vpc name from the var that we created
  tags = {
    Name = var.vpcname
  }
}

resource "aws_vpc" "myvpc2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.mylist[0]
  }
}

resource "aws_vpc" "myvpc3" {
  cidr_block = "10.0.0.0/16"
  tags       = {
    Name = var.mymap["key1"]
  }
}

resource "aws_vpc" "myvpc4" {
  cidr_block = "10.0.0.0/16"
    tags = {
      Name = var.inputname
    }
}

##################################################################
#output vars
output "vpcid" {
  value = aws_vpc.myvpc1.id
}

##################################################################
variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "DY"
    port = [22,25,80]
  }
}






