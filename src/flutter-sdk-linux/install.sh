#!/bin/sh
set -eux

export DEBIAN_FRONTEND="noninteractive"

apt update
apt install -y --no-install-recommends \
    clang \
    cmake \
    git \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    libstdc++-12-dev

apt clean