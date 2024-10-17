# Description: Script to build and push images to Azure Container Registry
# Usage: ./bin/acr_app.sh

az acr build \
--image petstorepetservice:latest \
--registry 22tsvacr \
--file ../petstorepetservice/Dockerfile \
../petstorepetservice/