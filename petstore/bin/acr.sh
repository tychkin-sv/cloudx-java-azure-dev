# Description: Script to build and push images to Azure Container Registry
# Usage: ./bin/acr.sh

az acr build \
--image petstoreapp:latest \
--registry 22tsvacr \
--file ../petstoreapp/Dockerfile \
../petstoreapp/