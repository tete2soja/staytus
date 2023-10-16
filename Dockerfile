FROM ruby:3.1-alpine
LABEL org.opencontainers.image.vendor="Synoptik Labs"
LABEL org.opencontainers.image.authors="nicolas.legall@synoptik-labs.com"
LABEL org.opencontainers.image.title="Staytus"
LABEL org.opencontainers.image.base.name="nioupola/staytus:latest"
LABEL org.opencontainers.image.source="https://github.com/tete2soja/staytus"
LABEL org.opencontainers.image.licenses="MIT"

USER root

RUN apk add --update --no-cache build-base nodejs npm mariadb-dev   

COPY . /opt/staytus

ENV BUNDLER_WITHOUT development test
RUN cd /opt/staytus && \
    bundle config set --local without 'development:test' && \
    bundle config set --local deployment 'true' && \
    bundle install

ENTRYPOINT ["sh", "/opt/staytus/docker-start.sh"]