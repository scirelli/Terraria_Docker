FROM alpine:latest
MAINTAINER Steve Cirelli "steve@cirelli.org"

ARG INSTALL_PACKAGES='wget unzip'
ARG TERRARIA_DOWNLOAD='https://terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip'
ARG EXTRACTED_FOLDER_NAME=1404

ARG TERRARIA_PORT=7777

ENV MONO_IOMAP=all

EXPOSE $TERRARIA_PORT/tcp

RUN apk add --no-cache $INSTALL_PACKAGES libc6-compat libgcc gcompat && \
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
        apk del $INSTALL_PACKAGES && \
    echo 'done'

COPY ./serverconfig.txt /opt/terraria/

ENTRYPOINT ["terraria", "-password "]]
