# setup docker
V=$(date +%Y%m%d%H%M)
IMAGE=docker.io/christian773/ansible-ee
TAG=$IMAGE:$V

pip3 install ansible-builder
ansible-builder build --tag $TAG
podman tag $TAG $IMAGE:latest

podman images

echo "PRESS ENTER TO PUSH, CTRL-C to finish"
read x
podman push $TAG
podman push $IMAGE:latest
