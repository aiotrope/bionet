FROM node:lts-bullseye-slim 

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY *.json ./

COPY yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

EXPOSE 4321

CMD [ "yarn", "dev" ]