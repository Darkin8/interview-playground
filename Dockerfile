FROM ubuntu:latest
MAINTAINER Darkin8 <darkin8@gmail.com>
RUN apt-get update
RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password password 12345'
RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 12345'
RUN apt-get install -q -y mysql-server
RUN apt-get install -q -y nodejs
RUN apt-get install -q -y npm
RUN apt-get install -q -y nodejs
RUN mkdir /home/darkin
ADD . /home/darkin
WORKDIR /home/darkin
RUN /etc/init.d/mysql start
RUN npm install
RUN mysql -u root -p12345 < ./init_data.sql
RUN nodejs app
