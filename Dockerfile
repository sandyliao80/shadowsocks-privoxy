FROM alpine:latest
MAINTAINER bluebu <bluebuwang@gmail.com>

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

RUN \
  apk --update --upgrade add \
      py-pip \
      privoxy \
  && rm /var/cache/apk/*

RUN pip install shadowsocks

ENV SERVER_ADDR= \
    SERVER_PORT=8899  \
    METHOD=r4-md5 \
    TIMEOUT=300 \
    PASSWORD=

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------
EXPOSE 8118 7070

ENTRYPOINT ["/entrypoint.sh"]
