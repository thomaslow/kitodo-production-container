#!/bin/bash

cd "$(dirname "$0")"
source ./common.sh



${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_maven_1 /bin/bash -c "mysql --host=database --user=kitodo --password=kitodo -D kitodo < Kitodo/setup/schema.sql"
${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_maven_1 /bin/bash -c "mysql --host=database --user=kitodo --password=kitodo -D kitodo < Kitodo/setup/default.sql"
${DOCKER_BASE_CMD} exec -it ${COMPOSE_PROJECT}_maven_1 /bin/bash -c "cd Kitodo-DataManagement && mvn flyway:baseline ${FLYWAY_URL} -Pflyway && mvn flyway:migrate ${FLYWAY_URL} -Pflyway"