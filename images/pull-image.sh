#!/bin/bash

OS_NAME=$(uname -s)
OS_VERSION=$(uname -r)
CPU_ARCH=$(uname -m)
IMAGE_WITH_TAG=$1
TAR_FILE=$(echo "${CPU_ARCH}_${IMAGE_WITH_TAG}" | sed 's/[/:]/_/g').tar

echo "====================================="
echo "Operating System Name: $OS_NAME"
echo "Operating System Version: $OS_VERSION"
echo "CPU_ARCH: $CPU_ARCH"
echo "IMAGE_WITH_TAG: $IMAGE_WITH_TAG"
echo "TAR_FILE: $TAR_FILE"

skopeo --override-os linux copy --dest-tls-verify=false docker://docker.rainbond.cc/${IMAGE_WITH_TAG} docker-archive:${TAR_FILE}  --additional-tag ${IMAGE_WITH_TAG}

docker load -i ${TAR_FILE}
echo "====================================="
