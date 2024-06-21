#!/bin/sh
set -eux

FLUTTER_SDK_VERSION=$VERSION
FLUTTER_SDK_FILENAME="flutter_linux_${FLUTTER_SDK_VERSION}-stable.tar.xz"
FLUTTER_SDK_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_SDK_FILENAME}"
export DEBIAN_FRONTEND="noninteractive"

apt update
apt install -y --reinstall ca-certificates
apt install -y --no-install-recommends \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa
apt clean

curl -kLO "$FLUTTER_SDK_URL"
tar -xf "$FLUTTER_SDK_FILENAME" -C /usr/bin/
git config --global --add safe.directory /usr/bin/flutter
rm "$FLUTTER_SDK_FILENAME"

echo 'source <(flutter bash-completion)' >> ~/.bashrc
