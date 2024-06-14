# Build docker images for the petstore project
# petstore/bin/web.sh
docker build -t petstoreapp ../petstoreapp
docker build -t petstorepetservice ../petstorepetservice
docker build -t petstoreproductservice ../petstoreproductservice
docker build -t petstoreorderservice ../petstoreorderservice
