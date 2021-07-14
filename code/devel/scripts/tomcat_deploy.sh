#!/bin/bash

cd "$(dirname "$0")"
source ./common.sh

# copy war file into container
(cd .. && ${DOCKER_BASE_CMD} cp ${WORK_DIR}/Kitodo/target/kitodo-3.3.war ${COMPOSE_PROJECT}_tomcat_1:/usr/local/tomcat/webapps/kitodo.war)

# touch file to trigger reload
${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_tomcat_1 touch /usr/local/tomcat/webapps/kitodo.war