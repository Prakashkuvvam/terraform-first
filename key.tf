resource "aws_key_pair" "mykp" {
  key_name   = "prakash"
  public_key = tls_private_key.myrsa.public_key_openssh
  tags = {
    Name = "Prakash"
  }
}
resource "tls_private_key" "myrsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "mypem" {
  content  = tls_private_key.myrsa.private_key_pem
  filename = "${path.module}/prakash.pem"
}