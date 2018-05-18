# NAME:    skylark/base
# VERSION: release

FROM dockerhub.qingcloud.com/skylark/base:2.5.0-jemalloc-ubuntu
MAINTAINER Phil Chen '06fahchen@gmail.com'

# Skylark specific bits
RUN useradd skylark -s /bin/bash -m -U && mkdir -p /var/www/skylark
RUN chown -R skylark:skylark /var/www/skylark

USER skylark
WORKDIR /var/www/skylark

RUN bundle config --local mirror.https://rubygems.org https://gems.ruby-china.org

COPY ./skylark/Gemfile* ./
RUN bundle install --deployment --without test development -j4 && \
    find /var/www/skylark/vendor/bundle -name tmp -type d -exec rm -rf {} +

COPY ./skylark/package.json ./
COPY ./skylark/yarn.lock ./
RUN NODE_ENV=production yarn install

COPY ./skylark/ /var/www/skylark/

USER root
