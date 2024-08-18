resource "aws_instance" "ansible_controller" {
  ami = var.ami-ansible
  instance_type = var.isntance-type
  key_name = var.key-name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.us-east-2a-subnet.id

  tags = {
    Name = "ansible"
  }
}

resource "aws_instance" "servers" {
  
  count = 2

  ami = var.ami-servers
  instance_type = var.isntance-type
  key_name = var.key-name

  tags = {
    Name = "web-${count.index}"
  }
}



