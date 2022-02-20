# true if want to deploy from exit ami
ami_with_pf = "true"
#ami_id = "ami-0e69f084b72f62fa9"
ami_id = "ami-0a7559a0ef82639f2"

# IAM Access and Secret Key for your IAM user
aws_access_key = ""
aws_secret_key = ""
region = "us-east-1"
//key_name = "phoenix"
key_name = "terraform-pa"
//private_key_path = "C:\\work\\phoenix.pem"
//private_key_path = "C:\\Users\\Dovy\\Desktop\\Guides\\Terraform"
private_key_path = "C:\\Projects\\Premium SaaS"
subnetId = "subnet-0fda51a48a12e1f2c"
instanceName = "evs-tests"
instance_type_desc = "t2.micro"
vpc_security_group_ids = ["sg-08bcf6cef717aa481"]
