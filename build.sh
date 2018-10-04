#!/bin/sh

set -ex

VERSION=0.0.0
TAG=nokamoto13/webdriver:$VERSION
TAG_SCALA=nokamoto13/webdriver-scala:$VERSION

(cd webdriver && docker build -t $TAG .)
(cd webdriver-scala && docker build -t $TAG_SCALA --build-arg VERSION=$VERSION .)

if [ "$1" = "--push" ]
then
    docker push $TAG
    docker push $TAG_SCALA
fi
