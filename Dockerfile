FROM node:18 as base

WORKDIR /opt/app/

FROM base as build

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

FROM base

COPY --from=build /opt/app /opt/app/

ARG NODE_ENV

ENV NODE_ENV $NODE_ENV

CMD [ "node", "app.js" ]