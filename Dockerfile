FROM ghcr.io/dockhippie/alpine:3.23@sha256:a674aadc1cccd2f424673c7596eff46336210016a50c8082849071f78bb15105
ENTRYPOINT [""]

# renovate: datasource=pypi depName=flac2all
ENV FLAC2ALL_VERSION=5.4

RUN apk update && \
  apk upgrade && \
  apk add lame ffmpeg flac python3 python3-dev py3-pip build-base && \
  pip3 install --break-system-packages -U flac2all==${FLAC2ALL_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
