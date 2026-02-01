FROM ghcr.io/dockhippie/alpine:3.23@sha256:290fa97fc3c00802b2a80f40cc21cdd5e6534a4422dcdb0abd57738ac08e86bf
ENTRYPOINT [""]

# renovate: datasource=pypi depName=flac2all
ENV FLAC2ALL_VERSION=5.4

RUN apk update && \
  apk upgrade && \
  apk add lame ffmpeg flac python3 python3-dev py3-pip build-base && \
  pip3 install --break-system-packages -U flac2all==${FLAC2ALL_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
