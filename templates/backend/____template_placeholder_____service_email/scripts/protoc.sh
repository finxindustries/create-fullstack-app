#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
cd "${BASEDIR}"/../

PROTOC_GEN_TS_PATH="./node_modules/.bin/protoc-gen-ts"
GRPC_TOOLS_NODE_PROTOC_PLUGIN="./node_modules/.bin/grpc_tools_node_protoc_plugin"
GRPC_TOOLS_NODE_PROTOC="./node_modules/.bin/grpc_tools_node_protoc"

for f in $(find ./proto -name '*.proto'); do
  # loop over all the available proto files and compile them into respective dir
  # JavaScript code generating
  ${GRPC_TOOLS_NODE_PROTOC} \
      --js_out=import_style=commonjs,binary:"./src/proto" \
      --grpc_out="./src/proto" \
      --plugin=protoc-gen-grpc="${GRPC_TOOLS_NODE_PROTOC_PLUGIN}" \
      -I "./proto" \
      ${f}

  ${GRPC_TOOLS_NODE_PROTOC} \
      --plugin=protoc-gen-ts="${PROTOC_GEN_TS_PATH}" \
      --ts_out="./src/proto" \
      -I "./proto" \
      ${f}
done