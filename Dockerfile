FROM ubuntu
MAINTAINER Martin Bower
ENV REFRESHED_AT 2016-08-26

RUN apt-get update
RUN apt-get install -y curl build-essential m4 libncurses5-dev libssh-dev 
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && apt-get install perl
RUN curl get.mojolicio.us | sh
RUN curl -L http://cpanmin.us | perl - Mojolicious::Plugin::AccessLog
ENV REFRESHED_AT 2016-08-26
RUN mkdir /var/log/docker
ADD . /srv/www

EXPOSE 8080

WORKDIR /srv/www/my_app

CMD hypnotoad -f script/webapp
