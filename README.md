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

# check if dockerized app will run at port specified port e.g 8000
docker run -d -p 8000:4321 aiotrope/bionet-ui:latest
docker ps

# stop running dockerized app
docker stop $(docker ps -a -q)

# start minikube
cd kubernetes/ && minikube start

# start a new terminal, and leave this running
minikube dashboard

# enable metric server
minikube addons enable metrics-server
# check if metric server is running
kubectl get pods -n kube-system

# create new namespace & set it as a default namespace
kubectl create namespace bionet-namespace && kubectl config set-context --current --namespace=bionet-namespace

# deploy to k8s
kubectl apply -f bionet-ui-deployment.yml
kubectl apply -f bionet-ui-service.yml
kubectl apply -f bionet-ui-deployment-hpa.yml

# check deployment
kubectl get deployments

# check services
kubectl get services
kubectl get svc

# check hpa
kubectl get hpa

# check and ensure the pods are running with no errors
kubectl get pods

# check resource usage of the pods
kubectl top pod

# check auto-scaling
minikube service bionet-ui-service -n bionet-namespace --url
# e.g http://127.0.0.1:50766

# access k86 deployed service
minikube service -n bionet-namespace bionet-ui-service

# auto scaling without config file
kubectl autoscale -f bionet-ui-deployment.yml --min=2 --max=5 --cpu-percent=5
# check hpa
kubectl get hpa
# delete auto scaling
kubectl delete hpa bionet-ui-deployment

# delete and cleanup
kubectl delete -f bionet-ui-deployment.yml
kubectl delete -f bionet-ui-service.yml
kubectl delete -f bionet-ui-deployment-hpa.yml
# stop cluster but no deletion
minikube stop

# delete all 
kubectl delete pods --all -A
kubectl delete deploy --all -A
kubectl delete all --all -A # all resources
minikube delete
```
