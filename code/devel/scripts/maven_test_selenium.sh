#!/bin/bash

cd "$(dirname "$0")"
source ./common.sh

${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_maven_1 xvfb-run --server-args="-screen 0 1600x1280x24" mvn clean install -B '-Pselenium,!development'