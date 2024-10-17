# Description: Script to build and push images to Azure Container Registry
# Usage: ./bin/acr_app.sh

az acr build \
--image petstoreorderservice:latest \
--registry 22tsvacr \
--file ../petstoreorderservice/Dockerfile \
../petstoreorderservice/