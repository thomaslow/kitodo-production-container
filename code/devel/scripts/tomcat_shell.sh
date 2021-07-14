#!/bin/bash

cd "$(dirname "$0")"
source ./common.sh

${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_tomcat_1 /bin/bash