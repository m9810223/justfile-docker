# syntax=docker/dockerfile:1


ARG BUILDER
ARG RUNNER
ARG JUST_VERSION
ARG WORKDIR


FROM --platform=$TARGETPLATFORM \
    ${BUILDER} AS builder
ARG JUST_VERSION
RUN apk add musl-dev
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    cargo install just@${JUST_VERSION}


FROM --platform=$TARGETPLATFORM \
    ${RUNNER} AS runner
ARG WORKDIR
COPY --from=builder \
    /usr/local/cargo/bin/just \
    /usr/local/bin/
WORKDIR ${WORKDIR}
ENTRYPOINT ["/usr/local/bin/just"]
