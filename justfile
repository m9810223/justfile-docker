# [misc]

_default: _fmt

@_fmt:
    just --fmt --unstable

# [docker]

DOCKER := "docker"
BUILDER_NAME := "justfile-docker"
BUILDER_PLATFORM := "linux/amd64,linux/arm64,linux/arm/v7,linux/386"

create_builder:
    {{ DOCKER }}  buildx create \
        --driver docker-container \
        --name {{ BUILDER_NAME }} \
        --platform {{ BUILDER_PLATFORM }} \
        || true

remove_builder:
    {{ DOCKER }}  buildx rm --keep-state {{ BUILDER_NAME }}

bake *OPTIONS: create_builder && remove_builder
    {{ DOCKER }} buildx bake \
        --builder {{ BUILDER_NAME }} \
        --pull \
        {{ OPTIONS }}

bake-push: (bake "--push")

#  [example]

demo:
    docker run --pull always --rm -it -v $(pwd):/jwd m9810223/justfile -lu
