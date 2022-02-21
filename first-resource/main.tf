
# env: playground
# VPC: vpc-018bb4cf140efe95a

# user details:
# terraform-pa
# playground
variable "access_key" {default = "AKIA2ZTNWZETR5ZZRZPJ"}
variable "secret_key" {default = "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"}
variable "region" {default = "us-east-2"}
variable "ami_id" {default = "ami-02aa7f3de34db391a"}
variable "instance_type" {default = "t2.micro"}

# declare resource
resource "aws_instance" "web1" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
}

# declare provider
provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  version = "~> 2.0"
}
