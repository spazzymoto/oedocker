FROM ubuntu:latest

LABEL maintainer="Robert Edwards (robertedwardsmail@mip.co.za)"

RUN apt update && \
    apt install --no-install-recommends --no-install-suggests -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt install --no-install-recommends --no-install-suggests -y oracle-java8-installer && \
    apt clean && \
    mkdir /install && \
    mkdir /install/openedge && \
    mkdir /opt/openedge/ && \
    mkdir /opt/openedge/117/ && \
    mkdir /db

COPY PROGRESS_OE_11.7.2_LNX_64.tar.gz /install/openedge/PROGRESS_OE_11.7.2_LNX_64.tar.gz

RUN cd /install/openedge/ && \
    tar xzf PROGRESS_OE_11.7.2_LNX_64.tar.gz && \
    rm /install/openedge/PROGRESS_OE_11.7.2_LNX_64.tar.gz

ENV TERM xterm
ENV DLC /opt/openedge/117/dlc
ENV DB_PATH /db

VOLUME /db
