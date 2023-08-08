FROM busybox
COPY --from=m9810223/justfile:v1.14.0 /usr/local/bin/just /usr/local/bin/
RUN just --version > /just-version.txt
CMD cat /just-version.txt
# docker build -f example.Dockerfile -t dev . && docker run --rm dev
