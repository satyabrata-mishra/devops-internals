output "instance_ip_addr"{
	value = aws_instance.test.public_ip
	description = "The private IP address of the main server instance."
}
