##########
# piwik installation
##########

# Set the base image for this installation
FROM centos:6.6

#File Author / Maintainer

MAINTAINER bajaj ritesh.bajaj6@gmail.com

#Pre-reqs

RUN yum clean all && \
yum -y update && \
yum -y install httpd mod_rewrite mod_ssl mod_env php php-common php-cli php-mysql mysql-server unzip && \
rm -fr /var/cache/*

#Files that need to be added
ADD mysql_setup.sql /tmp/
ADD piwik.conf /etc/httpd/conf.d/


#install wget package
RUN yum -y install wget 


#Application installation
RUN wget -P /var/www/html/ http://builds.piwik.org/piwik.zip && \
unzip /var/www/html/piwik.zip -d /var/www/html/ && \
rm -fr /var/www/html/piwik.zip

#for service command install
#


#
RUN service mysqld start && \
mysql < /tmp/mysql_setup.sql && \
rm -fr /tmp/mysql_setup.sql* && \
service mysqld stop 

#Expose Necessary Ports
EXPOSE 80

#give permission to apache user
RUN chown -R apache:apache /var/www/html/piwik

#INSTALL php-mbstring for piwik 
RUN yum install php-mbstring
                                                                                                                                           
                                                                                                                                           
                                                                                                                                           
                                                                                                                                           
                                                                                                                                           
                                                                       
