FROM quay.io/openshiftlabs/antora-for-mad-ws:1.0 as builder

ADD . /antora/

RUN antora generate --stacktrace site.yml

FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

COPY --from=builder /antora/gh-pages/ /var/www/html/