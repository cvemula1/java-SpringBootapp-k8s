export DOCKER_ID_USER="chennaraov"
export DOCKER_IMAGE="springboot"
mvn clean install
docker build -t springboot .
docker tag springboot:latest $DOCKER_ID_USER/$DOCKER_IMAGE:latest
docker login -u $DOCKER_ID_USER -p $DOCKER_PW - hub.docker.com
docker push $DOCKER_ID_USER/$DOCKER_IMAGE:latest
