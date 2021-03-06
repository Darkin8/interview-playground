FROM ubuntu:latest
MAINTAINER Darkin8 <darkin8@gmail.com>
RUN apt-get update
RUN echo 'mysql-server mysql-server/root_password password 12345' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password 12345' | debconf-set-selections
RUN apt-get install -q -y mysql-server
RUN apt-get install -q -y nodejs
RUN apt-get install -q -y npm
RUN apt-get install -q -y nodejs
RUN apt-get install -q -y git
RUN mkdir /home/darkin
ADD . /home/darkin
WORKDIR /home/darkin
RUN npm install
RUN /etc/init.d/mysql start; mysql -u root -p12345 < /home/darkin/init-data.sql
CMD /etc/init.d/mysql start; nodejs app
