resource "aws_instance" "myec2" {
  ami                    = "ami-0e001c9271cf7f3b9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id              = aws_subnet.mysub.id
  key_name               = aws_key_pair.mykp.key_name
  tags = {
    Name = "Scholar EC2"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("${aws_key_pair.mykp.key_name}.pem")
  }
  # user_data = file("${path.module}/userdata.sh")

  #   provisioner "file" {
  #     source      = "./docker.sh"
  #     destination = "/tmp/"
  #   }
  #  provisioner "file" {
  #     source      = "./jenkins.sh"
  #     destination = "/tmp/"
  #   }

  provisioner "remote-exec" {
    script = "./userdata.sh"
  }
  
  depends_on = [local_file.mypem, tls_private_key.myrsa, aws_key_pair.mykp]

  lifecycle {
    create_before_destroy = true
  }
}