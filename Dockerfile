FROM node:18.19.1-alpine

WORKDIR /app

COPY ./package.build.json ./package.json
COPY ./yarn.lock .

ENV NODE_ENV production
ENV REDIS_HOST localhost
ENV REDIS_PORT 6379
ENV REDIS_USE_TLS false
ENV REDIS_PASSWORD ''
ENV BULL_PREFIX bull
ENV BULL_VERSION BULLMQ
ENV USER_LOGIN ''
ENV USER_PASSWORD ''
ENV REDIS_DB 0
ENV PROXY_PATH ''

RUN yarn install

COPY . .

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

CMD ["node", "src/index.js"]
