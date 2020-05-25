FROM ubuntu:latest
MAINTAINER Steve Cirelli "steve@cirelli.org"

ARG TERRARIA_DOWNLOAD='https://terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip'
ARG EXTRACTED_FOLDER_NAME=1404
ARG INSTALL_PACKAGES='wget unzip'

ARG TERRARIA_PORT=7777
ARG TERRARIA_WORLD_NAME=DockerWorld
ENV MONO_IOMAP=all

EXPOSE $TERRARIA_PORT/tcp

RUN apt-get update && apt-get -y upgrade && apt-get -y install $INSTALL_PACKAGES && \
    cd /tmp && \
        wget -O terraria.zip $TERRARIA_DOWNLOAD && \
        unzip terraria.zip && \
        mv $EXTRACTED_FOLDER_NAME/Linux /opt/terraria && \
        mkdir -p /var/terraria/worlds && \
    cd /opt/terraria && \
        chmod 744 /opt/terraria/TerrariaServer.bin.* && \
        ln -s /opt/terraria/TerrariaServer.bin.x86_64 /usr/local/bin/terraria && \
    echo 'clean up' && \
        cd /tmp && \
        rm -rf terraria.zip $EXTRACTED_FOLDER_NAME && \
        apt-get -y remove $INSTALL_PACKAGES && \
        apt-get clean && apt-get -y autoremove && \
    echo 'done'

COPY ./serverconfig.txt /etc/terraria/

ENTRYPOINT ["terraria", "-config", "/etc/terraria/serverconfig.txt", "-worldname", "$TERRARIA_WORLD_NAME",  "-password "]]
