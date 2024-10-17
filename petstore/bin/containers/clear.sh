# Clear all containers starts with 'pet'
# Usage: ./bin/clear.sh
docker rmi -f $(docker images | grep '^pet' | awk '{ print $3 }')