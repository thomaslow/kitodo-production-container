# Kitodo.Production Container

This projects provides a docker container environment for development purposes 
of Kitodo.Production (Linux only).

## Requirements

Docker

- Install Docker, see https://docs.docker.com/get-docker/

- Install `docker-compose`, see https://docs.docker.com/compose/install/

Or: Podman

- Podman should work too, see `code/devel/scripts/common.sh` to replace 
  docker commands with to `podman` and `podman-compose`

Tested with Fedora 34

- Using docker package `moby-engine v20.10.6`


## Development Environment

Set up kitodo with docker

- Checkout the Kitodo.Production 
  [repository](https://github.com/kitodo/kitodo-production) into some 
  directory referenced as `WORK_DIR`

- Create a file `code/devel/.env` and set the path to this checkout 
  directory as `WORK_DIR=/path/to/checkout`

- Update the Kitodo.Production configuration
  - Point to hostname `database` instead of `localhost` in `hibernate.cfg.xml` 
    and `flyway.properties` for database access
  - Point to hostname `elastic` instead of `localhost` in 
    `kitodo_config.properties` for elastic search access

Build and run container

- Run `code/devel/build.sh` to download and build docker images

- Run `code/devel/up.sh` to start all containers (database, elastic, maven)
  - `WORK_DIR` will be mounted to the `maven` container, such that any changes 
    to these files will be immediately visible inside the container
  - `DATA_DIR/<service>` will be mounted to the respective storage directories 
    for ElasticSearch and the database

- On the first time, run `code/devel/scripts/database_setup.sh` to 
  populate the database

Develop using docker container

- Do your stuff in Eclipse. File changes will be immediately 
  available inside the container. However, debug messages are based on your 
  local environment (local Java version, local Maven version, etc.)

- Alternatively, use [Visual Studio Code](https://code.visualstudio.com/) with 
  the [Java Extension Pack](
  https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack
  ) and the "[Remote - Container](
  https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
  )" plugin to get correct debug information from inside the container

- Run `code/devel/scripts/maven_*.sh` to perform various maven commands

- Enter an interactive shell via `code/devel/scripts/maven_shell.sh` for 
  custom commands inside the container

Testing

- Make sure there is a WAR file at `${WORK_DIR}/Kitodo/target/kitodo-3.3.war`

- Run `code/devel/scripts/tomcat_deploy.sh` to copy the war file into tomcat container 
  webapps directory

- Go to `http://localhost:8080/kitodo/`

Finish development

- Stop docker container via `code/devel/down.sh`


## Related Projects

Similar implementations can be found here:

 - [kitodo-contrib](https://github.com/kitodo/kitodo-contrib/tree/master/uben/docker)
 - [UB Mannheim](https://github.com/UB-Mannheim/kitodo-production-docker)