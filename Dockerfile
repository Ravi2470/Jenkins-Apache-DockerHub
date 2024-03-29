

FROM ubuntu

## File Author / Maintainer
MAINTAINER ravi

# Update the repository sources list
RUN apt-get update

# Install and run apache
RUN apt-get install -y apache2

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]
COPY index.html /var/www/html

#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
CMD apachectl -D FOREGROUND
