FROM node:16.13.2-buster-slim

RUN apt update -y && apt install libssl-dev -y

WORKDIR /code

COPY . /code

RUN npm config set registry https://registry.npmjs.org/

RUN npm ci
