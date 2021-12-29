FROM quay.io/keycloak/keycloak:16.1.0

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

LABEL org.opencontainers.image.source https://github.com/luckyraul/docker-oauth

RUN sed -i 's/<location name="\/" handler="welcome-content"\/>//g' /opt/jboss/keycloak/standalone/configuration/standalone.xml
RUN sed -i 's/<div id="kc-form"/<div class="kc-badge"><\/div><div id="kc-form"/g' /opt/jboss/keycloak/themes/base/login/login.ftl

ENV KEYCLOAK_WELCOME_THEME mygento
ADD theme /opt/jboss/keycloak/themes/mygento
