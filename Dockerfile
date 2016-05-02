FROM java:8-jre-alpine
RUN apk --update add openssl

ENV KEYCLOAK_VERSION 1.9.3.Final

RUN wget https://downloads.jboss.org/keycloak/1.9.3.Final/keycloak-proxy-${KEYCLOAK_VERSION}.zip \
  && unzip keycloak-proxy-* \
  && mv keycloak-proxy-${KEYCLOAK_VERSION} keycloak-proxy \
  && rm keycloak-proxy*.zip

EXPOSE 8080

CMD ["/usr/bin/java", "-jar", "/keycloak-proxy/bin/launcher.jar", "/proxy.json"]