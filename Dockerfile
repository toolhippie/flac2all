FROM ghcr.io/dockhippie/alpine:3.23@sha256:4c36d44370ea880f0be5a8972d1d3a9230c5113f1b05f786dd214e6897168478
ENTRYPOINT [""]

# renovate: datasource=pypi depName=flac2all
ENV FLAC2ALL_VERSION=5.4

RUN apk update && \
  apk upgrade && \
  apk add lame ffmpeg flac python3 python3-dev py3-pip build-base && \
  pip3 install --break-system-packages -U flac2all==${FLAC2ALL_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
