# bionet

## Running the app

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
