# build stage
ARG PACKAGE_TAG

ARG IMAGE=node:16.13.2-buster-slim-keystonejs-$PACKAGE_TAG

FROM $IMAGE AS builder

WORKDIR /code

COPY . /code

RUN npm run build

ENV NODE_ENV production

CMD ["npm", "start"]
