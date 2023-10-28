FROM node:lts-bullseye-slim  as build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY *.json ./

COPY yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN astro build

FROM nginx:latest as server

RUN sed -i "s/80/4321/g" /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 4321

CMD ["nginx", "-g", "daemon off;"]