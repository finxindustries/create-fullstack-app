#!/usr/bin/env bash

PROTOC="$PWD/tools/protoc"
BACKEND_DIR="$PWD/backend"
FRONTEND_DIR="$PWD/frontend"
PROJECTS=("____template_placeholder_____service_email" "____template_placeholder_____client_user_flutter")

echo "protoc generation only configured to work on MacOS and maybe Linux!!!"

for project in "${PROJECTS[@]}"; do
    echo "Generating proto stubs for $project"
    case $project in
    "____template_placeholder_____service_email")
        cd "$BACKEND_DIR/$project"
        npm run proto-gen
        ;;

    "____template_placeholder_____client_user_flutter")
        cd "$FRONTEND_DIR/____template_placeholder_____client_user/$project"
        ./scripts/protoc.sh
        ;;

    *) echo "ERROR: Don't know what to generate for $project" ;;
    esac
done

echo "Done!"
