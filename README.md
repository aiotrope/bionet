# bionet

## Running

```bash
# DEBUG MODE
# buid docker images based on docker-compose config; running on port 7800
docker compose -f docker-compose.dev.yml up --build
# stop running container
docker compose -f docker-compose.dev.yml down
# to restart on detach mode 
docker compose -f docker-compose.dev.yml up -d
```