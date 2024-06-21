# Description: Script to build and push images to Azure Container Registry
# Usage: ./bin/acr_app.sh

az acr build \
--image petstoreapp:old \
--registry 22tsvacr \
--file ../petstoreapp/Dockerfile \
../petstoreapp/