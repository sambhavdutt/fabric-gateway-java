#!/bin/bash -e
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

cd ${WORKSPACE}/gopath/src/github.com/hyperledger/fabric-gateway-java
# Short Head commit
gateway_java_commit=$(git rev-parse --short HEAD)
echo "-------> gateway_java_commit:" $gateway_java_commit
target_repo=fabric-gateway-java.github.io.git
git config --global user.email "fabric-gateway-java@gmail.com"
git config --global user.name "fabric-gateway-java"
# Clone GATEWAY_JAVA API docs repository
git clone https://github.com/fabric-gateway-java/$target_repo
# Copy API docs to target repository & push to gh-pages URL
cp -r $WORKSPACE/$BASE_DIR/target/apidocs/* fabric-gateway-java.github.io
cd fabric-gateway-java.github.io
git add .
git commit -m "gateway_java_commit - $gateway_java_commit"
# Credentials are stored as Global Variables in Jenkins
git config remote.gh-pages.url https://fabric-gateway-java:cojrh85b30vf87w@github.com/fabric-gateway-java/$target_repo
# Push API docs to target repository
git push gh-pages master
