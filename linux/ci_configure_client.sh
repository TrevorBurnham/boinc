#!/bin/sh
set -e

if [ ! -d "linux" ]; then
    echo "start this script in the source root directory"
    exit 1
fi

CACHE_DIR="$PWD/3rdParty/buildCache/linux"
BUILD_DIR="$PWD/3rdParty/linux"
VCPKG_ROOT="$BUILD_DIR/vcpkg"
export VCPKG_DIR="$VCPKG_ROOT/installed/x64-linux"

linux/update_vcpkg_client.sh

export _libcurl_pc="$VCPKG_DIR/lib/pkgconfig/libcurl.pc"
./configure --with-libcurl=$VCPKG_DIR --with-ssl=$VCPKG_DIR --disable-server --enable-client --disable-manager
