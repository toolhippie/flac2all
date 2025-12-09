FROM ghcr.io/dockhippie/alpine:3.23@sha256:4e6a8cfc8c6550ca615c09eb1d667b3ee884a827a97965a2e9f5e5142dc9e05a
ENTRYPOINT [""]

# renovate: datasource=pypi depName=flac2all
ENV FLAC2ALL_VERSION=5.4

RUN apk update && \
  apk upgrade && \
  apk add lame ffmpeg flac python3 python3-dev py3-pip build-base && \
  pip3 install --break-system-packages -U flac2all==${FLAC2ALL_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
