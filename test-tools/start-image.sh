#!/bin/bash

BASE_PATH=$(pwd)
REPO_PATH=$(cd $1 && pwd)
: ${NETLIFY_IMAGE="sha256:bb90c768dfa69f00f8ee5ec2dd360e856d34dbc82246f1b68398ea7a41477c70"}

docker run --rm -t -i \
	-e NODE_VERSION \
	-e NPM_VERSION \
	-e RUBY_VERSION \
	-e YARN_VERSION \
	-e HUGO_VERSION \
	-e PHP_VERSION \
	-e GO_VERSION \
	-e SWIFT_VERSION \
	-e PYTHON_VERSION \
	-v ${REPO_PATH}:/opt/repo \
	-v ${BASE_PATH}/run-build.sh:/opt/build-bin/build \
	-v ${BASE_PATH}/run-build-functions.sh:/opt/build-bin/run-build-functions.sh \
	$NETLIFY_IMAGE /bin/bash
