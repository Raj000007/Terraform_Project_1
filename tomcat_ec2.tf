terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
access_key= "AKIAZUXYAQ6GTLPITXEQ"
secret_key= "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"
region= "ap-south-1"
}

resource "aws_instance" "Apache_Tomcat" {

  ami           = "ami-0e6329e222e662a52"
  instance_type = "t2.micro"
key_name= "batch"
vpc_security_group_ids      = ["${aws_security_group.Tomcat.id}"]
 user_data                   = "${file("tomcat.sh")}"
 tags = {
    "Name" = "Tomcat"
  }
  }

