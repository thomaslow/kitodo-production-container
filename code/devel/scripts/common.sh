# set defaults
export WORK_DIR=../../../kitodo-production
export DATA_DIR=../../data/development

# load env file overwriting defaults
[ -f "../cat" ] && export $(cat ../.env | xargs)

# use docker and docker-compose by default
DOCKER_BASE_CMD="docker"
COMPOSE_BASE_CMD="docker-compose"

# use podman instead of docker
# DOCKER_BASE_CMD="podman"
# COMPOSE_BASE_CMD="podman-compose"

COMPOSE_PROJECT="kitodo_production_devel"
COMPOSE_FILE="../docker-compose.yml"
COMPOSE_CMD="${COMPOSE_BASE_CMD} -f ${COMPOSE_FILE} -p ${COMPOSE_PROJECT}"

FLYWAY_URL="-Dflyway.url=jdbc:mysql://database/kitodo?useSSL=false"

# create required directories
(cd .. && mkdir -p ${DATA_DIR}/elastic)
(cd .. && mkdir -p ${DATA_DIR}/database)
(cd .. && mkdir -p ${DATA_DIR}/tomcat)
