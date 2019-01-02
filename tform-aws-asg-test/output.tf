output "public_ip" {
  value = "${aws_instance.terraform-centos.public_ip}"
}
