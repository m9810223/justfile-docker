# syntax=docker/dockerfile:1


ARG _JUST_VERSION
ARG _WORKDIR
ARG _BUILDER
ARG _RUNNER


FROM --platform=$TARGETPLATFORM \
    ${_BUILDER} AS builder
ARG _JUST_VERSION
ARG _RUST_JOBS
RUN apk add musl-dev
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    cargo install just@${_JUST_VERSION}


FROM --platform=$TARGETPLATFORM \
    ${_RUNNER} AS runner
ARG _WORKDIR
COPY --from=builder \
    /usr/local/cargo/bin/just \
    /usr/local/bin/
WORKDIR ${_WORKDIR}
ENTRYPOINT ["/usr/local/bin/just"]
