FROM alpine:3.2
RUN apk --update add openjdk7-jre openssl

ENV KEYCLOAK_VERSION 1.9.3.Final

RUN wget https://downloads.jboss.org/keycloak/1.9.3.Final/keycloak-proxy-${KEYCLOAK_VERSION}.zip \
  && unzip keycloak-proxy-* \
  && mv keycloak-proxy-${KEYCLOAK_VERSION} keycloak-proxy \
  && rm keycloak-proxy*.zip

EXPOSE 8080

CMD ["/usr/bin/java", "-jar", "/keycloak-proxy/bin/launder.jar", "/proxy.json"]