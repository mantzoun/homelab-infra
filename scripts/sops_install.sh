#!/bin/bash

SOPS_VERSION="v3.13.3"

if command -v sops > /dev/null; then
    echo "sops is already installed. Run with --force to re-install"
    if [[ "$1" != "--force" ]];then
        exit 0
    fi
fi

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
    arch="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    arch="arm64"
else
    echo "Unsupported architecture $ARCH"
    exit 2
fi

curl -LO https://github.com/getsops/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.${arch}

if [[ $? -ne 0 ]];then
    echo "Error downloading sops"
    exit 3
fi

mv sops-${SOPS_VERSION}.linux.${arch} /usr/local/bin/sops
chmod +x /usr/local/bin/sops

sops --version
