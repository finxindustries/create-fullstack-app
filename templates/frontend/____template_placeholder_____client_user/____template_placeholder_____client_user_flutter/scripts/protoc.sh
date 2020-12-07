#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
cd "${BASEDIR}"/../

PROTOC="../../../tools/protoc"

for f in $(find ./proto -name '*.proto'); do
    $PROTOC --dart_out=grpc:lib/proto -Iproto ${f}
done
