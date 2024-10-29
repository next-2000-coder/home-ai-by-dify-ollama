#!/bin/bash

OS_NAME=$(uname -s)
OS_VERSION=$(uname -r)
CPU_ARCH=$(uname -m)

echo "Operating System Name: $OS_NAME"
echo "Operating System Version: $OS_VERSION"
echo "CPU_ARCH: $CPU_ARCH"

IMAGE_WITH_TAG=$1
TAR_FILE=$(echo "${CPU_ARCH}_${IMAGE_WITH_TAG}" | sed 's/[/:]/_/g').tar
skopeo --override-os linux copy --dest-tls-verify=false docker://docker.rainbond.cc/${IMAGE_WITH_TAG} oci-archive:${TAR_FILE}  --additional-tag ${IMAGE_WITH_TAG}

docker load -i ${TAR_FILE} 