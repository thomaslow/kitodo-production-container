#!/bin/bash

cd "$(dirname "$0")"/scripts
source ./common.sh

${COMPOSE_CMD} down