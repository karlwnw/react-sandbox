FROM ubuntu:16.04

# config
ENV DEFAULT_USERNAME ubuntu
ENV NODE_VERSION 8.9.1
ENV NPM_VERSION 5.5.1
ENV APP_USERNAME app
ENV APP_ROOT /app

# run provisioning
COPY provisioning/ /tmp/provisioning/
RUN cd /tmp/provisioning && bin/provision-docker-dev.sh

WORKDIR /app
USER app

EXPOSE 3000