#!/bin/bash
sudo su -
cd /tmp
yum install -y java
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar -xf apache-tomcat-9.0.75.tar.gz
sh apache-tomcat-9.0.75/bin/startup.sh




#!/bin/bash
cd /tmp
sudo yum install -y java
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar -xf apache-tomcat-9.0.75.tar.gz
sed -i '56 i\<role rolename="manager-gui"/>' /tmp/apache-tomcat-9.0.75/conf/tomcat-users.xml
sed -i '57 i\<role rolename="manager-script"/>' /tmp/apache-tomcat-9.0.75/conf/tomcat-users.xml
sed -i '58 i\<role rolename="manager-jmx"/>' /tmp/apache-tomcat-9.0.75/conf/tomcat-users.xml
sed -i '59 i\<role rolename="manager-status"/>' /tmp/apache-tomcat-9.0.75/conf/tomcat-users.xml
sed -i '60 i\<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx,manager-status"/>' /tmp/apache-tomcat-9.0.75/conf/tomcat-users.xml
sed -i '19,1 i\<!--' /tmp/apache-tomcat-9.0.75/webapps/manager/META-INF/context.xml
sed -i '24,1 i\-->' /tmp/apache-tomcat-9.0.75/webapps/manager/META-INF/context.xml
sh apache-tomcat-9.0.75/bin/startup.sh
