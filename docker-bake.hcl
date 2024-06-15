variable IMAGE_NAME {
  default = "docker.io/m9810223/justfile"
}
variable just_versions {
  default = [
    "1.29.1",
    "1.28.0",
    // "1.27.0",
  ]
}
variable base_images {
  default = [
    "alpine:3.20.0",
    "alpine:3.19.1",
    // "alpine:3.18.6",
    // "alpine:3.17.7",
    // "alpine:3.16.9",
    // 
    "debian:trixie-slim",   // 13
    "debian:bookworm-slim", // 12
    "debian:bullseye-slim", // 11
    // "debian:buster-slim",   // 10
    // 
    "docker:26.1.4-dind-rootless",
    "docker:26.1.4-dind",
    // 
    "docker:25.0.5-dind-rootless",
    "docker:25.0.5-dind",
  ]
}

group default {
  targets = ["multi-platform"]
}
target multi-platform {
  name = "${replace_name_with_underscore(RUNNER)}-v${replace_name_with_underscore(JUST_VERSION)}"
  tags = [
    "${IMAGE_NAME}:${replace(RUNNER, ":", "-")}-v${JUST_VERSION}",
    // https://docs.docker.com/build/bake/advanced/#ternary-operators
    and(equal(JUST_VERSION, just_versions[0]), equal(RUNNER, base_images[0])) ? "${IMAGE_NAME}:latest" : "",
  ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    // "linux/arm",
    // "linux/386",
  ]
  args = {
    BUILDER      = "docker.io/library/rust:alpine"
    RUNNER       = RUNNER
    JUST_VERSION = JUST_VERSION
    WORKDIR      = "/jwd"
  }
  matrix = {
    JUST_VERSION = just_versions
    RUNNER       = base_images
  }
}

function "replace_name_with_underscore" {
  params = [name]
  result = regex_replace(name, "[^a-zA-Z0-9_-]", "_")
}
