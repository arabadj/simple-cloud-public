#!/bin/bash

export COMPOSE_PROJECT_NAME="frontend"
export PATH_DOCKER="/usr/bin"
export PATH_COMPOSE="/usr/local/bin"
export PATH_SERVICE="/opt/simple/frontend"

cd $PATH_SERVICE/etc/

$PATH_COMPOSE/docker-compose kill &> /dev/null
$PATH_COMPOSE/docker-compose rm -f &> /dev/null
$PATH_COMPOSE/docker-compose down &> /dev/null
