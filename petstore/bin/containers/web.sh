# Build docker images for the petstore project
# Usage: ./bin/web.sh
docker build -t petstoreapp ../petstore/petstoreapp
docker build -t petstorepetservice ../petstore/petstorepetservice
docker build -t petstoreproductservice ../petstore/petstoreproductservice
docker build -t petstoreorderservice ../petstore/petstoreorderservice
