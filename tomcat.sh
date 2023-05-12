#!/bin/bash
sudo su -
cd /tmp
yum install -y java
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar -xf apache-tomcat-9.0.75.tar.gz
sh apache-tomcat-9.0.75/bin/startup.sh

