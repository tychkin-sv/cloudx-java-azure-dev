# Description: This script creates an Azure App Service with a custom Docker image.
# Usage: ./bin/appservice.sh

function create_app_service() {
webappname=$1
resourcegroup=$2
planname=$3
imagename=$4
acr_login_server=$5
version=$6

az webapp create \
--name $webappname \
--resource-group $resourcegroup \
--plan $planname \
--resource-group $resourcegroup \
 --deployment-container-image-name $acr_login_server/$imagename:$version

az webapp config container set \
--name $webappname \
--resource-group $resourcegroup \
--docker-custom-image-name $acr_login_server/$imagename:$version \
--docker-registry-server-url "https://$acr_login_server"
}

ASP_NAME="tsv-web-petstore-east"
RG_NAME="web_rg"
PLAN_NAME="asp-web-eastus"
IMAGE_NAME="petstoreapp"
ACR_LOGIN_SERVER="22tsvacr"
VER="latest"

create_app_service $ASP_NAME $RG_NAME $PLAN_NAME $IMAGE_NAME $ACR_LOGIN_SERVER $VER

ASP_NAME="tsv-web-petstore-west"
RG_NAME="web_rg"
PLAN_NAME="asp-web-eastus"
IMAGE_NAME="petstoreapp"
ACR_LOGIN_SERVER="22tsvacr"
VER="latest"

create_app_service $ASP_NAME $RG_NAME $PLAN_NAME $IMAGE_NAME $ACR_LOGIN_SERVER $VER

ASP_NAME="tsv-petstorepetservice"
RG_NAME="web_rg"
PLAN_NAME="asp-web-eastus"
IMAGE_NAME="petstorepetservice"
ACR_LOGIN_SERVER="22tsvacr"
VER="latest"

create_app_service $ASP_NAME $RG_NAME $PLAN_NAME $IMAGE_NAME $ACR_LOGIN_SERVER $VER

ASP_NAME="tsv-petstoreorderservice"
RG_NAME="web_rg"
PLAN_NAME="asp-web-eastus"
IMAGE_NAME="petstoreorderservice"
ACR_LOGIN_SERVER="22tsvacr"
VER="latest"

create_app_service $ASP_NAME $RG_NAME $PLAN_NAME $IMAGE_NAME $ACR_LOGIN_SERVER $VER

ASP_NAME="tsv-petstoreproductservice"
RG_NAME="web_rg"
PLAN_NAME="asp-web-eastus"
IMAGE_NAME="petstoreproductservice"
ACR_LOGIN_SERVER="22tsvacr"
VER="latest"

create_app_service $ASP_NAME $RG_NAME $PLAN_NAME $IMAGE_NAME $ACR_LOGIN_SERVER $VER