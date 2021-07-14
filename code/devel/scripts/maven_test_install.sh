#!/bin/bash

cd "$(dirname "$0")"
source ./common.sh

${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_maven_1 mvn clean install ${FLYWAY_URL} -B '-Pall-tests,flyway,checkstyle,spotbugs,!development' 

