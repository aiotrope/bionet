FROM node:lts-bullseye-slim  as build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY *.json ./

COPY yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN astro build

FROM nginx:latest as server

EXPOSE 4321

COPY bionet-ui.nginx.prod.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]