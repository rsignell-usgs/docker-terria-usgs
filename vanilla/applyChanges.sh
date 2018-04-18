#!/bin/bash
cd /opt/docker
docker stop terriamap
docker rmi -f terria-local
docker rm $(docker ps -qa –no-trunc –filter "status=exited")
docker rmi $(docker images –filter "dangling=true" -q –no-trunc)
docker ps
docker images
cd ~/Docker
docker build -t terria-local .
cd /opt/docker
docker-compose up -d terriamap
