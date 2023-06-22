terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
provider "aws"{
access_key= "AKIAZUXYAQ6GVP7RT6VD"
secret_key= "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"
region= "ap-south-1"
}

resource "aws_instance" "Tomcat_conf" {
  ami           = "ami-0e6329e222e662a52"
  instance_type = "t2.micro"
key_name= "batch"
vpc_security_group_ids      = ["${aws_security_group.Tomcat_conf.id}"]
provisioner "remote-exec"  {
    inline  = [
    "sudo yum install -y java",
    "sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz",
    "sudo yum upgrade -y", 
    "sudo tar -xf apache-tomcat-9.0.68.tar.gz",
   "sed -i '56 i\  <role rolename="manager-gui"/>' /root/apache-tomcat-9.0.68/conf/tomcat-users.xml",
"sed -i '57 i\   <role rolename="manager-script"/>' /root/apache-tomcat-9.0.68/conf/tomcat-users.xml",
"sed -i '58 i\ <role rolename="manager-jmx"/>' /root/apache-tomcat-9.0.68/conf/tomcat-users.xml",
"sed -i '59 i\  <role rolename="manager-status"/>' /root/apache-tomcat-9.0.68/conf/tomcat-users.xml",
"sed -i '60 i\ <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx,manager-status"/>' /root/apache-tomcat-9.0.68/conf/tomcat-users.xml",
"sed -i '19,1 i\<!--' /root/apache-tomcat-9.0.68/webapps/manager/META-INF/context.xml",
"sed -i '24,1 i\-->' /root/apache-tomcat-9.0.68/webapps/manager/META-INF/context.xml",
"sh apache-tomcat-9.0.68/bin/startup.sh",
    ]
    }
connection {
    type         = "ssh"
        host         = self.public_ip
	    user         = "ec2-user"
	        private_key  = file("C:\\Users\\User\\Downloads\\batch.pem" )
		   }
  tags = {
    "Name" = "Tomcat_conf"
  }
}
