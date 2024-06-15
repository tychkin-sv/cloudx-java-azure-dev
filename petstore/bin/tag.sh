# Tag the Docker image using the docker tag command
# petstore/bin/tag.sh
docker tag petstorepetservice:latest 22tsvacr.azurecr.io/petstorepetservice:latest
docker tag petstoreproductservice:latest 22tsvacr.azurecr.io/petstoreproductservice:latest
docker tag petstoreorderservice:latest 22tsvacr.azurecr.io/petstoreorderservice:latest
docker tag petstoreapp:latest 22tsvacr.azurecr.io/petstoreapp:latest