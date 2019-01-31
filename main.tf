provider "aws" {
    region = "eu-west-1"
}


resource "aws_instance" "web_server"{
  count                                = "1"
  ami                                  = "ami-049f47f8a332ba288"
  instance_type                        = "t2.micro"
  key_name                             = "webserver_key"
  vpc_security_group_ids               = ["sg-0ecda5c095519f32f"]
  tags                                 { Name = "web-server" }
}

output "public_ip" {
  value = "${aws_instance.web_server.public_dns}"
}

