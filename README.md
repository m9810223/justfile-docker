# 🤖 just (command runner) 🐳 docker image

> crates.io: <https://crates.io/crates/just>
>
> just: <https://github.com/casey/just>
>
> justfile-docker: <https://github.com/m9810223/justfile-docker>
>
> docker hub: <https://hub.docker.com/r/m9810223/justfile>

## Supported platforms (OS/ARCH)

- linux/amd64
- linux/arm64/v8
<!-- - linux/386
- linux/arm/v7 -->
<!-- - linux/arm/v5
- linux/mips64le
- linux/ppc64le
- linux/s390x
- linux/arm/v6
- linux/amd64/v2 -->

## Docker image tags

<https://hub.docker.com/r/m9810223/justfile/tags>

```shell
docker pull m9810223/justfile
docker run --rm -it -v $(pwd):/jwd m9810223/justfile -V
```

- [latest](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=latest)
- [v1.25.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.25.0)
- [v1.24.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.24.0)
- [v1.14.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.14.0)
- [v1.13.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.13.0)
- [v1.12.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.12.0)
- [alpine](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine)
    - [3.19](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.19)
    - [3.18](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.18)
    - [3.17](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.17)
    - [3.16](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.16)
- [debian](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian)
    - [trixie](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-trixie)
    - [bookworm](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-bookworm)
    - [bullseye](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-bullseye)
    - [buster](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-buster)
- [docker](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker)
    - [dind](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-dind)
    - [dind-rootless](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-dind-rootless)
    - [git](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-git)

## Update Images

```sh
just update
```
