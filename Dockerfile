FROM ruby:3.1
LABEL org.opencontainers.image.authors="nicolas.legall@synoptik-labs.com"

USER root

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y nodejs
    
COPY . /opt/staytus

RUN cd /opt/staytus && \
    bundle install --deployment --without development:test

ENTRYPOINT /opt/staytus/docker-start.sh
