#!/usr/bin/env bash

# mono --server --gc=sgen -O ./TerrariaServer.exe
screen -S terraria mono --server --gc=sgen -O=all /opt/terraria/current/Linux/TerrariaServer.exe
