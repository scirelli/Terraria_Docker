FROM ubuntu:latest
MAINTAINER Steve Cirelli "steve@cirelli.org"

ARG TERRARIA_DOWNLOAD
ARG EXTRACTED_FOLDER_NAME
ARG INSTALL_PACKAGES='wget unzip'

ARG TERRARIA_PORT=7777

ENV MONO_IOMAP=all

EXPOSE $TERRARIA_PORT/tcp

COPY . ./tmp/

RUN apt-get update && apt-get -y upgrade && apt-get -y install $INSTALL_PACKAGES screen && \
    cd /tmp && \
        wget -O terraria.zip $TERRARIA_DOWNLOAD && \
        unzip terraria.zip && \
        mv $EXTRACTED_FOLDER_NAME/Linux /opt/terraria && \
        mkdir -p /var/terraria/worlds && \
        mkdir -p /var/logs/terraria && \
    cd /opt/terraria && \
        chmod 744 /opt/terraria/TerrariaServer.bin.* && \
        ln -s /opt/terraria/TerrariaServer.bin.x86_64 /usr/local/bin/terraria && \
    mkdir -p /etc/terraria && \
        mv /tmp/serverconfig.txt /etc/terraria/ &&\
        mv /tmp/sc.sh /opt/ && \
        chmod 744 /opt/sc.sh && \
    echo 'clean up' && \
        cd /tmp && \
        rm -rf terraria.zip $EXTRACTED_FOLDER_NAME && \
        apt-get -y remove $INSTALL_PACKAGES && \
        apt-get clean && apt-get -y autoremove && \
    echo 'done'

ENTRYPOINT ["/opt/sc.sh"]
