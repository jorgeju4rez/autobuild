#!/bin/bash

clear
echo "Autobuild v0.0.1"
echo "Made by: jorgeju4rez"
echo "Licence: MIT"
echo \	
echo "==== Menu options ===="
echo "1. Docker"
echo "2. Kubernetes"
echo "3. Licence"
echo "4. Exit"
echo "======================"
echo \	

read -p 'Select menu option: ' userOption



fun_docker () {
   rm -r deploy
   mkdir -p deploy/app/docker
   cd deploy/app/docker
   touch Dockerfile docker-compose.yml docker-compose.env
   printf "version: "3.0"

services:
  name-image:
    container_name: name-image
    build:
      context: ../../
      dockerfile: deploy/docker/Dockerfile
    restart: unless-stopped
#    ports:
#      - "3000:80"
    image: name-image
" >> docker-compose.yml

   printf "FROM node:18-alpine

WORKDIR /usr/src/app

COPY . .


RUN yarn install 

#RUN yarn install -g moleculer

RUN yarn run build

RUN mv build ../

ENV TZ="Europe/Madrid"

#RUN rm -rf ./*
#RUN shopt extglob
#RUN setopt extendedglob && rm -r !(node_modules)
RUN find . -maxdepth 1 ! -name 'node_modules' -type f -exec rm -v {} +

RUN rm -r src

RUN rm -r deploy

RUN mv ../build/* ./


COPY package*.json ./

EXPOSE 80

CMD ["yarn","run", "prod"]

" >> Dockerfile
}

fun_kubernetes () {
   echo "Kubernetes";
}

fun_licence () {
   clear
   echo "MIT License
Copyright (c) 2023 jorgeju4rez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.";
}

case $userOption in
1)
   fun_docker
   ;;
2)
   fun_kubernetes
   ;;
3) 
   fun_licence
   ;;
4)
   exit
   ;;
*)
   echo "default"
   ;;
esac


