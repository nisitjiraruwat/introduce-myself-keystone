FROM node:16.13.2-buster-slim

RUN apt update -y && apt install libssl-dev -y

WORKDIR /code

COPY package-lock.json /code
COPY package.json /code

RUN npm config set registry https://registry.npmjs.org/

ARG OPTIONS_ARG

RUN npm ci $OPTIONS_ARG
