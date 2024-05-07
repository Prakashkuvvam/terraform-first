resource "aws_instance" "myec2" {
  ami                    = "ami-0e001c9271cf7f3b9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id              = aws_subnet.mysub.id
  key_name = aws_key_pair.mykp.key_name
  tags = {
    Name = "Scholar EC2"
  }
}