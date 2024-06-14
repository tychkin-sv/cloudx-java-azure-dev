# Clear all containers starts with 'pet'
# petstore/bin/clear.sh
docker rmi $(docker images | grep '^pet' | awk '{ print $3 }')