FROM node:16.13.2-buster-slim

RUN apt update -y && apt install libssl-dev -y
