# NAME:    skylark/base
# VERSION: release

FROM dockerhub.qingcloud.com/skylark/base:2.3.1-ubuntu.0914
MAINTAINER Phil Chen '06fahchen@gmail.com'

# Skylark specific bits
RUN useradd skylark -s /bin/bash -m -U && \
    mkdir -p /var/www/skylark

WORKDIR /var/www/
COPY ./skylark/ /var/www/skylark/

WORKDIR /var/www/skylark
RUN chown -R skylark:skylark /var/www/skylark
USER skylark
RUN bundle config --local mirror.https://rubygems.org https://gems.ruby-china.org && \
    bundle config --local github.https true
RUN bundle install --deployment --without test development -j4 && \
    find /var/www/skylark/vendor/bundle -name tmp -type d -exec rm -rf {} +
USER root
