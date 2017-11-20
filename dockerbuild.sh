export DOCKER_ID_USER="chennaraov"
export DOCKER_IMAGE="springboot"
chmod 700 dockerbuild.sh
mvn clean install
docker build -t springboot .
docker tag springboot:latest $DOCKER_ID_USER/$DOCKER_IMAGE:latest
docker login -u $DOCKER_ID_USER -p $DOCKER_PW
docker push $DOCKER_ID_USER/$DOCKER_IMAGE:latest
docker images -qa | xargs docker rmi -f
rm -rf targt
