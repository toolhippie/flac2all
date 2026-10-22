FROM ghcr.io/dockhippie/alpine:3.23@sha256:0518a97b1c6406d9777d435432dcb525b4f47a84562e13a6472f55ac6623f9f6
ENTRYPOINT [""]

# renovate: datasource=pypi depName=flac2all
ENV FLAC2ALL_VERSION=5.4

RUN apk update && \
  apk upgrade && \
  apk add lame ffmpeg flac python3 python3-dev py3-pip build-base && \
  pip3 install --break-system-packages -U flac2all==${FLAC2ALL_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
