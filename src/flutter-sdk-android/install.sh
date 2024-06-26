#!/bin/sh
set -eux

ANDROID_SDK_CMDLINE_TOOLS_FILENAME="commandlinetools-linux-11076708_latest.zip"
ANDROID_SDK_CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/${ANDROID_SDK_CMDLINE_TOOLS_FILENAME}"
export DEBIAN_FRONTEND="noninteractive"

apt update
apt install -y \
    android-sdk \
    openjdk-17-jdk

curl -o "${ANDROID_SDK_CMDLINE_TOOLS_FILENAME}" "${ANDROID_SDK_CMDLINE_TOOLS_URL}"
unzip "${ANDROID_SDK_CMDLINE_TOOLS_FILENAME}"
mkdir -p /usr/lib/android-sdk/cmdline-tools/latest
mv cmdline-tools/* /usr/lib/android-sdk/cmdline-tools/latest
rm "${ANDROID_SDK_CMDLINE_TOOLS_FILENAME}"
rm -r cmdline-tools
export ANDROID_HOME="/usr/lib/android-sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/bin"
yes y | sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"
