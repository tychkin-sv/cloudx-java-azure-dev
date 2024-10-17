# Build images directly to azure container registry
# Usage: ./bin/acrbuild.sh
function acr_build() {
imagename=$1
tag=$2
acrname=$3
path=$4
dockerfile="Dockerfile"

az acr build \
--image $imagename:$tag \
--registry $acrname \
--file $path$dockerfile \
$path
}
# Login to Azure
az acr login --name 22tsvacr

# Build the images
acr_build "petstoreapp" "latest" "22tsvacr" "../petstoreapp/"
acr_build "petstoreorderservice" "latest" "22tsvacr" "../petstoreorderservice/"
acr_build "petstorepetservice" "latest" "22tsvacr" "../petstorepetservice/"
acr_build "petstoreproductservice" "latest" "22tsvacr" "../petstoreproductservice/"
# End of file