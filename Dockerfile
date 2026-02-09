FROM node:latest

WORKDIR /app

COPY . /app/

COPY package*.json /app/

RUN npm install -g pnpm

RUN pnpm install --config.node-linker=hoisted

RUN mkdir -p node_modules/@rubynetwork/rh/cache-js

RUN pnpm run build

EXPOSE 8080

CMD ["pnpm", "start"]
