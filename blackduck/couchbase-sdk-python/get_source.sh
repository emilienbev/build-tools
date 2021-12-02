#!/bin/bash -ex

PRODUCT=$1
RELEASE=$2
VERSION=$3
BLD_NUM=$4

git clone git://github.com/couchbase/couchbase-python-client.git
pushd couchbase-python-client
if git rev-parse --verify --quiet $VERSION >& /dev/null
then
    echo "Tag $VERSION exists, checking it out"
    git checkout $VERSION
else
    echo "No tag $VERSION, assuming master"
    git checkout master
fi
