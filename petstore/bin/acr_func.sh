# Description: Script to build and push images to Azure Container Registry
# Usage: ./bin/acr_func.sh

az acr build \
--image orderitemsreserver:latest \
--registry 22tsvacr \
--file ../orderitemsreserver/Dockerfile \
../orderitemsreserver/