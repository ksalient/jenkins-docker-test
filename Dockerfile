# This Dockerfile defines an Ubuntu image
# to run dobieTest selenium test suite
#

FROM ubuntu:latest

LABEL maintainer="donema83@gmail.com"

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends locales

RUN apt-get dist-upgrade -y

RUN apt-get -y install software-properties-common

RUN add-apt-repository ppa:webupd8team/java

RUN apt update

RUN apt-get install -y --no-install-recommends oracle-java8-installer oracle-java11-set-default

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
