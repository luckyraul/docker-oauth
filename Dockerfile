FROM registry.access.redhat.com/ubi9/ubi-minimal:9.1 as rhel
RUN microdnf -y install unzip

FROM quay.io/keycloak/keycloak:21.0.1

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

LABEL org.opencontainers.image.source https://github.com/luckyraul/docker-oauth

COPY --from=rhel /lib64/libbz2.so.1.0.8 /lib64/libbz2.so.1
COPY --from=rhel /usr/bin/unzip /usr/bin/unzip

ADD --chown=keycloak:keycloak theme /opt/keycloak/themes/mygento

RUN mkdir -p /opt/keycloak/themes/default && \
    unzip /opt/keycloak/lib/lib/main/org.keycloak.keycloak-themes-21.0.1.jar -d /opt/keycloak/themes/default && \
    cp /opt/keycloak/themes/default/theme/base/login/login.ftl /opt/keycloak/themes/mygento/login/login.ftl && \
    sed -i 's/<div id="kc-form"/<div class="kc-badge"><\/div><div id="kc-form"/g' /opt/keycloak/themes/mygento/login/login.ftl && \
    rm -fR /opt/keycloak/themes/default