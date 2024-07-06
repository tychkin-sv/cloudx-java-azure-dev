## Console
mvn clean package  
## Run the function locally
There are two ways to run function
1. Maven
mvn azure-functions:run
2. IntelliJ


## Blob storage emulator
azurite --silent --location c:\azurite --debug c:\azurite\debug.log


Press Ctrl+C (Command+C on macOS) to stop the host.

## Build the container image and verify locally

docker build --tag <DOCKER_ID>/azurefunctionsimage:v1.0.0 .

docker run -p 8080:80 -it <DOCKER_ID>/azurefunctionsimage:v1.0.0

## Publish the container image to a registry
az acr login --name <REGISTRY_NAME>
docker tag <DOCKER_ID>/azurefunctionsimage:v1.0.0 <LOGIN_SERVER>/azurefunctionsimage:v1.0.0
docker push <LOGIN_SERVER>/azurefunctionsimage:v1.0.0

