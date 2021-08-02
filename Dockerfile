FROM quay.io/keycloak/keycloak:15.0.0

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

LABEL org.opencontainers.image.source https://github.com/luckyraul/docker-oauth

RUN sed -i 's/<location name="\/" handler="welcome-content"\/>//g' /opt/jboss/keycloak/standalone/configuration/standalone.xml

ENV KEYCLOAK_WELCOME_THEME mygento
ADD theme /opt/jboss/keycloak/themes/mygento
