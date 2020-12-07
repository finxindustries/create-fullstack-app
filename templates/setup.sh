#!/usr/bin/env bash

PROTOC_VERSION='3.14.0'
OS=''

BASE_DIR="$PWD"

exists() { (
    IFS=:
    for d in $PATH; do
        if test -x "$d/$1"; then return 0; fi
    done
    return 1
); }

rm -rf tools
mkdir -p tools
cd tools
case "$OSTYPE" in
darwin*) OS='osx-x86_64' ;;
linux*) OS='linux-x86_64' ;;
msys*) OS='win64' ;;
cygwin*) OS='win64' ;;
win32*) OS='win64' ;;
*) echo "unknown OS: $OSTYPE" && exit 1 ;;
esac

protoc_base_url='https://github.com/protocolbuffers/protobuf/releases/download'
protoc_zip="protoc-$PROTOC_VERSION-$OS.zip"
protoc_url="$protoc_base_url/v$PROTOC_VERSION/$protoc_zip"
echo "Downloading $protoc_url"
wget $protoc_url
unzip $protoc_zip -d temp
rm $protoc_zip

if [ $OS == "win64" ]; then
    mv temp/bin/protoc.exe protoc.exe
else
    mv temp/bin/protoc protoc
fi
rm -rf temp
cd $BASE_DIR

exists "dart"
if [ $? -eq 0 ]; then
    echo "Getting pub protoc_plugin for Dart proto stubs generation"
    dart pub global activate protoc_plugin
    exists "protoc-gen-dart"
    if [ $? -eq 1 ]; then
        if [ $OS == "osx-x86_64" ]; then
            echo "Adding .pub-cache/bin to PATH"
            if [ $SHELL == "/bin/zsh" ]; then
                SHELL_PROFILE="$HOME/.zprofile"
            else
                SHELL_PROFILE="$HOME/.bash_profile"
            fi
            echo "export PATH=\"\$PATH:$HOME/.pub-cache/bin\"" >>$SHELL_PROFILE
            echo "INFO: Refreshing your shell profile: $SHELL_PROFILE"
            if [ $SHELL == "/bin/zsh" ]; then
                exec zsh --login
            else
                source $SHELL_PROFILE
            fi
        else
            echo "Please add .pub-cache/bin to PATH and run updateProtos.sh and genProtoStubs.sh"
            exit 1
        fi
    fi
else
    echo "dart/flutter not installed/installed wrong! Check PATH if installed!"
fi

cd $BASE_DIR
cd backend/____template_placeholder_____service_email
npm install

cd $BASE_DIR
cd frontend/____template_placeholder_____client_user/____template_placeholder_____client_user_flutter
flutter pub get

cd $BASE_DIR
./updateProtos.sh
./genProtoStubs.sh

echo "Done!"
