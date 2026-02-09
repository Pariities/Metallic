FROM node:latest

WORKDIR /app

COPY . /app/

COPY package*.json /app/

RUN npm install -g pnpm

RUN pnpm install --config.node-linker=hoisted

RUN pnpm rebuild @rubynetwork/rh

RUN mkdir -p node_modules/@rubynetwork/rh/cache-js node_modules/@rubynetwork/rh/public

RUN pnpm run build

EXPOSE 8080

CMD ["pnpm", "start"]
