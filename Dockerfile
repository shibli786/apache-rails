FROM rails:latest

MAINTAINER Syed Moinuddin Shibli<syed.shibli@daffodilsw.com>
#intsall apache
RUN  apt-get update && apt-get install -y apache2 \ 
	apache2-doc apache2-utils


#install passenger

RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
RUN  apt-get install -y apt-transport-https ca-certificates

# Add APT repository
RUN  sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
RUN  apt-get update

# Install Passenger + Apache module

RUN  apt-get install -y libapache2-mod-passenger

RUN  a2enmod passenger

    
# Set Apache environment variables (can be changed on docker run with -e)
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
#ENV APACHE_SERVERADMIN admin@localhost
#ENV APACHE_SERVERNAME localhost
#ENV APACHE_SERVERALIAS docker.localhost
#ENV APACHE_DOCUMENTROOT /var/www
    
EXPOSE 3000
ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]

