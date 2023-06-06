FROM ruby:3.1-alpine
LABEL org.opencontainers.image.authors="nicolas.legall@synoptik-labs.com"

USER root

RUN apk add --update --no-cache build-base nodejs npm mariadb-dev   

COPY . /opt/staytus

RUN cd /opt/staytus && \
    bundle config set --local without 'development:test' && \
    bundle config set --local deployment 'true' && \
    bundle install

ENTRYPOINT ["/opt/staytus/docker-start.sh"]