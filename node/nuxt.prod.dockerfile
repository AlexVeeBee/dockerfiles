FROM node:22.11.0-alpine AS builder

RUN mkdir -p /usr/src/app /usr/src/builder
WORKDIR /usr/src/builder
COPY package*.json ./
RUN npm install --no-audit --no-fund --loglevel=error --no-progress --omit=dev
COPY . .
RUN npm run build

FROM node:22.11.0-alpine AS app

RUN mkdir -p /usr/src/app
COPY --from=builder /usr/src/builder/.output /usr/src/app

EXPOSE 3000

CMD ["node", "/usr/src/app/server/index.mjs"]