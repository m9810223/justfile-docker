# [misc]

_default: _fmt

@_fmt:
    just --fmt --unstable

# [docker]

_D := "docker"
_DOCKERFILE := "Dockerfile"
_PLATFORM := "linux/amd64,linux/arm64/v8"

# _PLATFORM := "linux/amd64,linux/arm64/v8,linux/386,linux/arm/v7"

_IMAGE_NAME := "docker.io/m9810223/justfile"
_JUST_VERSION := "1.14.0"
_WORKDIR := "/jwd"
_BUILDER := "docker.io/library/rust:alpine"
_RUNNER := "docker.io/library/debian:trixie-slim"
_RUST_JOBS := "1"
__TAG_PREFIX := "debian-trixie-slim-"
_TAG := __TAG_PREFIX + "v" + _JUST_VERSION
_BUILDER_NAME := "just"
_BUILDKITD_CONFIG := "buildkitd.toml"

remove_builder:
    docker buildx rm {{ _BUILDER_NAME }} -f || true

create_builder:
    docker run --privileged --rm tonistiigi/binfmt --install all
    docker buildx create \
        --driver docker-container \
        --config {{ _BUILDKITD_CONFIG }} \
        --name {{ _BUILDER_NAME }} \
        --bootstrap \
        --use \
        --platform {{ _PLATFORM }} \
        || true

build_and_push:
    {{ _D }} buildx build \
        -f {{ _DOCKERFILE }} \
        --build-arg _JUST_VERSION={{ _JUST_VERSION }} \
        --build-arg _WORKDIR={{ _WORKDIR }} \
        --build-arg _BUILDER={{ _BUILDER }} \
        --build-arg _RUNNER={{ _RUNNER }} \
        --build-arg _RUST_JOBS={{ _RUST_JOBS }} \
        --pull \
        --push \
        --platform {{ _PLATFORM }} \
        -t {{ _IMAGE_NAME }}:{{ _TAG }} \
        .

build_and_push_latest:
    {{ _D }} buildx build \
        -f {{ _DOCKERFILE }} \
        --build-arg _JUST_VERSION={{ _JUST_VERSION }} \
        --build-arg _WORKDIR={{ _WORKDIR }} \
        --build-arg _BUILDER={{ _BUILDER }} \
        --build-arg _RUNNER={{ _RUNNER }} \
        --build-arg _RUST_JOBS={{ _RUST_JOBS }} \
        --pull \
        --push \
        --platform {{ _PLATFORM }} \
        -t {{ _IMAGE_NAME }}:latest \
        .

update: create_builder
    python update.py

demo:
    docker pull m9810223/justfile
    docker run --rm -it -v $(pwd):/jwd m9810223/justfile -lu
