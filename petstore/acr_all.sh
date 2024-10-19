# Build images directly to azure container registry
# Usage: ./acr_all.sh
function acr_build() {
imagename=$1
tag=$2
acrname=$3
path=$4
dockerfile="Dockerfile"

az acr build \
--image $imagename:$tag \
--registry $acrname \
--file $path/$dockerfile \
$path
}
# Login to Azure
az acr login --name 22tsvacr

PETSTOREAPP="petstoreapp"
PETSTOREORDERSERVICE="petstoreorderservice"
PETSTOREPETSERVICE="petstorepetservice"
PETSTOREPRODUCTSERVICE="petstoreproductservice"

IMAGE_TAG="latest"
ACR_NAME="22tsvacr"
PATH_TO_DOCKERFILE="../petstore/"

# Build the images
acr_build $PETSTOREAPP $IMAGE_TAG $ACR_NAME $PATH_TO_DOCKERFILE$PETSTOREAPP
acr_build $PETSTOREORDERSERVICE $IMAGE_TAG $ACR_NAME $PATH_TO_DOCKERFILE$PETSTOREORDERSERVICE
acr_build $PETSTOREPETSERVICE $IMAGE_TAG $ACR_NAME $PATH_TO_DOCKERFILE$PETSTOREPETSERVICE
acr_build $PETSTOREPRODUCTSERVICE $IMAGE_TAG $ACR_NAME $PATH_TO_DOCKERFILE$PETSTOREPRODUCTSERVICE
# End of file