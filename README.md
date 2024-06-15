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
- linux/arm64

## Docker image tags

<https://hub.docker.com/r/m9810223/justfile/tags>

```shell
docker run --pull always --rm -it -v $(pwd):/jwd m9810223/justfile -lu
```

- [latest](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=latest)
- [debian](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian)
    - [trixie](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-trixie)
    - [bookworm](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-bookworm)
    - [bullseye](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-bullseye)
    - [buster](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=debian-buster)
- [alpine](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine)
    - [3.20](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.20)
    - [3.19](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.19)
    - [3.18](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.18)
    - [3.17](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.17)
    - [3.16](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=alpine-3.16)
- [docker](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker)
    - [dind-rootless](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-dind-rootless)
    - [dind](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-dind)
    - [26.1.4](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-26.1.4)
    - [25.0.5](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-25.0.5)
    - [25.0.4](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-25.0.4)
    - [24.0.6](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=docker-24.0.6)
- [v1.29.1](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.29.1)
- [v1.28.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.28.0)
- [v1.27.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.27.0)
- [v1.26.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.26.0)
- [v1.25.2](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.25.2)
- [v1.25.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.25.0)
- [v1.24.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.24.0)
- [v1.14.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.14.0)
- [v1.13.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.13.0)
- [v1.12.0](https://hub.docker.com/r/m9810223/justfile/tags?page=1&name=v1.12.0)

## Update Images

```sh
just bake
# or
just bake-push
```
