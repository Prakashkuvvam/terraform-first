resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "Scholar Route Table"
  }
}
resource "aws_route_table_association" "myassoc" {
  route_table_id = aws_route_table.myrt.id
  subnet_id      = aws_subnet.mysub.id
}

resource "aws_security_group" "mysg" {
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Scholar-SG"
  }

} 