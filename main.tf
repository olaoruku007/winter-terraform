data "aws_key_pair" "Dev_KP_OH" {
  key_name           = "Dev_KP_OH"
  include_public_key = true

}


resource "aws_instance" "class_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "Dev_KP_OH"
  vpc_security_group_ids = [aws_security_group.SG.id]

  # count = 2


  tags = {

    Name = "class_ec2"

  }


}

resource "aws_security_group" "SG" {

  name = "terraform-webserverSG"


  ingress {
    description = "Allow SSH"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }



  ingress {
    description = "Allow httpd"

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
}

