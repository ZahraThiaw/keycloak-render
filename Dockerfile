FROM quay.io/keycloak/keycloak:26.0.8

# Configuration des variables d'environnement
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    KC_DB=postgres \
    KC_HOSTNAME_STRICT=false \
    KC_HOSTNAME_STRICT_HTTPS=false \
    KC_HTTP_ENABLED=true \
    KC_PROXY=edge \
    KC_CACHE=local \
    KC_HTTP_PORT=8080 \
    KC_HOSTNAME_PATH=/auth \
    PROXY_ADDRESS_FORWARDING=true \
    JAVA_OPTS="-Xms512m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m"

# Construction en mode optimisé
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080", "--proxy=edge"]
