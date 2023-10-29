# bionet

## Running the app

### Docker compose

```bash
# DEBUG MODE
# buid docker images based on docker-compose config; running on port 7800
docker compose -f docker-compose.dev.yml up --build

# stop running container
docker compose -f docker-compose.dev.yml down

# to restart on detach mode
docker compose -f docker-compose.dev.yml up -d

# PROD MODE
# buid docker images based on docker-compose config; running on port 7800
docker compose -f docker-compose.prod.yml up --build

# stop running container
docker compose -f docker-compose.prod.yml down

# to restart on detach mode
docker compose -f docker-compose.prod.yml up -d

# check images
docker images

# clean slate
docker system prune -a && docker images prune -a && docker volume prune -a
```

### Kubernetes

```bash
# build the app images and ensure the the app runs on dockerize mode before running K8s
cd bionet-ui/ && docker build -t aiotrope/bionet-ui -f ./k8s.Dockerfile .

# check images
docker images

# tag the image
docker tag aiotrope/bionet-ui aiotrope/bionet-ui

# push to docker hub
docker push aiotrope/bionet-ui

# check if dockerized app will run at port specified port e.g 3000
docker run -d -p 8000:4321 aiotrope/bionet-ui:latest
docker ps

# stop running dockerized app
docker stop $(docker ps -a -q)
```
