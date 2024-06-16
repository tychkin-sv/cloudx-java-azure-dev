# Push the Docker image to ACR using the docker push command.
# Usage: ./bin/push.sh
# az acr login --name 22tsvacr
# az acr update --name 22tsvacr --admin-enabled true
docker push 22tsvacr.azurecr.io/petstorepetservice:latest
docker push 22tsvacr.azurecr.io/petstoreproductservice:latest
docker push 22tsvacr.azurecr.io/petstoreorderservice:latest
docker push 22tsvacr.azurecr.io/petstoreapp:latest