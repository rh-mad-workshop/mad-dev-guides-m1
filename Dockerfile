# FROM quay.io/openshiftlabs/node:14-alpine-mad

# RUN mkdir -p /opt/src

# WORKDIR /opt/src

# ADD . /opt/src

# RUN chgrp -R 0 /opt/src && \
#     chmod -R g=u /opt/src

# RUN npm install

# CMD npm run dev -d

FROM docker.io/antora/antora as builder

ADD . /antora/

RUN antora generate --stacktrace site.yml

FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

COPY --from=builder /antora/gh-pages/ /var/www/html/