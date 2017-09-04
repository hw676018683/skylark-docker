# NAME:    skylark/elasticsearch
# VERSION: release
FROM elasticsearch:5.5.2-alpine

MAINTAINER Phil Chen '06fahchen@gmail.com'

COPY elasticsearch-analysis-ik-5.5.2.zip /tmp/
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install file:///tmp/elasticsearch-analysis-ik-5.5.2.zip

RUN rm -rf /tm/*
