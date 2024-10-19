## Console
mvn clean package  
## Run the function locally
You need to have Azure Functions Core Tools installed on your machine from 
[link here](https://go.microsoft.com/fwlink/?linkid=2174087)

After you can use Maven to run the function locally:

```sh
mvn azure-functions:run
```

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

