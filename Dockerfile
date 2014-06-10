# Canopsis - Open source hypervisor

FROM ubuntu:latest

MAINTAINER Gwenaël Pluchon, info@gwenp.fr

RUN apt-get update

RUN apt-get install sudo git-core libcurl4-gnutls-dev libncurses5-dev -y

RUN git clone https://github.com/capensis/canopsis.git

RUN cd canopsis && git checkout master && git submodule init && git submodule update

RUN cd canopsis/sources && sudo ./build-install.sh

# Launch wsshd when launching the container
ENTRYPOINT ["sudo su - canopsis -c \"hypcontrol start\""]

# wsshd runs by default on port 5000
EXPOSE 8082
