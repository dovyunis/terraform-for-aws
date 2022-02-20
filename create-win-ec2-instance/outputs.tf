##################################################################################
# OUTPUT
##################################################################################

output "aws_instance_public_dns" {
  value = aws_instance.pathfinder.public_dns
  description = "aws instance public dns"
}

output "instance_public_ip" {
  value       = aws_instance.pathfinder.public_ip
  description = "The public IP address of the main server instance."
}

output "aws_instance_encrypted_password" {
  value = rsadecrypt(aws_instance.pathfinder.password_data,file("C:\\Users\\Dovy\\Desktop\\Guides\\Terraform\\phoenix.pem"))
  description = "instance encrypted password"
}

output "aws_instance_id" {
  value = aws_instance.pathfinder.id
  description = "aws instance id"
}
