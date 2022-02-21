##################################################################################
# VARIABLES
##################################################################################

variable "ami_with_pf" {}
variable "ami_id" {}
variable "instance_type_desc" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "subnetId" {}
variable "instanceName" {}
variable "region" {}
variable "vpc_security_group_ids" {}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

##################################################################################
# DATA
##################################################################################

data "aws_ami" "aws-windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["679593333241"]
}

##################################################################################
# RESOURCES
##################################################################################

resource "aws_instance" "pathfinder" {

  # true - create image from exist ami , false - create image from clean ami
  ami = (var.ami_with_pf == "true" ? var.ami_id : data.aws_ami.aws-windows.id )
  instance_type               = var.instance_type_desc
  associate_public_ip_address = true
  get_password_data           = false
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  iam_instance_profile        = "phoenix"
  subnet_id				      = var.subnetId
  tags = {
    Name = var.instanceName
  }
}

# Assign elastic ip to ec2 instance
resource "aws_eip" "lb" {
  instance = aws_instance.pathfinder.id
  vpc      = true
}


