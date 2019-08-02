# This Dockerfile defines an Ubuntu image
# to run dobieTest selenium test suite
#

FROM ubuntu:latest

LABEL maintainer="donema83@gmail.com"

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends locales

RUN apt-get dist-upgrade -y

RUN apt-get -y install software-properties-common

RUN add-apt-repository ppa:linuxuprising/java

RUN apt update

RUN apt-get install -y tzdata

RUN apt-get install firefox -y

RUN apt-get install curl -y

RUN echo "America/New_York" > /etc/timezone

RUN dpkg-reconfigure -f noninteractive tzdata

WORKDIR /home

RUN touch getit.sh /home

RUN echo "wget ftp://doug:johnjohn@ftp.dobie.devx.us.com/establish.sh"

RUN echo "chmod +x establish.sh"

RUN chmod +x getit.sh

