FROM node:18-alpine

WORKDIR /usr/src/app

COPY . .


RUN yarn install 

#RUN yarn install -g moleculer

RUN yarn run build

RUN mv build ../

ENV TZ=Europe/Madrid

#RUN rm -rf ./*
#RUN shopt extglob
#RUN setopt extendedglob && rm -r !(node_modules)
RUN find . -maxdepth 1 ! -name 'node_modules' -type f -exec rm -v {} +

RUN rm -r src

RUN rm -r deploy

RUN mv ../build/* ./


COPY package*.json ./

EXPOSE 80

CMD [yarn,run, prod]

