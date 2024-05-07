output "ec2_pub_IP" {
  value = aws_instance.myec2.public_ip
}