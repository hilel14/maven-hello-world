#!/bin/bash

#get the current pom version and store it into a variable
version=$(mvn --quiet help:evaluate -Dexpression=project.version -DforceStdout)

# build the docker image
docker build . --tag hello:${version}