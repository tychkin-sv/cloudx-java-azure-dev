# Build docker images for the tsv project v2
az acr build --image petstoreapp:v2 --registry web_rg --file ../petstoreapp/Dockerfile .