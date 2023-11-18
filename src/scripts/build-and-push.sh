#!/bin/bash

#get the current pom version and store it into a variable
version=$(mvn --quiet help:evaluate -Dexpression=project.version -DforceStdout)

# build the docker image
docker build . --tag hilel14/hello:${version}

# push image to dokcer hub
docker image push hilel14/hello:${version}