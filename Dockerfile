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

RUN echo oracle-java11-installer-local shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN apt-get install -y --no-install-recommends oracle-java11-installer-local oracle-java11-set-default-local

RUN apt-get install -y tzdata

RUN apt-get install firefox -y

RUN apt-get install curl -y

RUN sudo echo "America/New_York" > /etc/timezone

RUN sudo dpkg-reconfigure -f noninteractive tzdata

WORKDIR /home

ADD getit.sh /home

RUN chmod +x getit.sh

#
# OK got everything now setup how it runs when loaded
#

CMD ./getit.sh
