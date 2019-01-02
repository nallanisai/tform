provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/home/ec2-user/aws/credentials"
  profile                 = "terraform"
}

resource "aws_security_group" "terraform_sg" {
  name="terraform_sg02"
  tags {
    Name = "terraform_sg02"
  }
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "${var.http_port}"
    to_port     = "${var.http_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "terraform-centos" {
  ami = "ami-4543be3d"
  instance_type = "t1.micro"
  vpc_security_group_ids = ["${aws_security_group.terraform_sg.id}"]
  key_name = "terraform-instance"
  tags {
    Name = "tf-instance02"
  }

}

