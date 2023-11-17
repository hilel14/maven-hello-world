#!/bin/bash

# Increase the patch part of the jar version in pom.xml
increment_version () {
    #get the current pom version and store it into a variable
    version=$(mvn --quiet help:evaluate -Dexpression=project.version -DforceStdout)
    #increment the last digit of the version and overwrite the variable
    version=$(echo ${version} |  awk -F'.' '{print $1"."$2"."$3+1}' |  sed s/[.]$//)
    #update the pom with the new version
    mvn -U versions:set -DnewVersion=${version}
}

# Commit and push back to the code repository
commit_and_push () {
    git config --global user.name 'hilel14'
    git config --global user.email 'hilel14@gmail.com'
    git commit -am "increment jar version"
    git push
}

increment_version
commit_and_push