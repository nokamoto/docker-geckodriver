#!/bin/sh

set -ex

VERSION=0.0.0

(cd geckodriver && docker build -t nokamoto13/geckodriver:$VERSION .)
(cd geckodriver-scala && docker build -t nokamoto13/geckodriver-scala:$VERSION --build-arg VERSION=$VERSION .)

if [ "$1" = "--push" ]
then
    docker push nokamoto13/geckodriver:$VERSION
    docker push nokamoto13/geckodriver-scala:$VERSION
fi
