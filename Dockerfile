FROM ghcr.io/dockhippie/alpine:3.18
ENTRYPOINT [""]

# renovate: datasource=pypi depName=flac2all
ENV FLAC2ALL_VERSION=5.1

RUN apk update && \
  apk upgrade && \
  apk add python3 python3-dev py3-pip lame ffmpeg flac build-base && \
  pip3 install -U flac2all==${FLAC2ALL_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
