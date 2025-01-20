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
    # Ne pas définir les variables de base de données ici car elles seront fournies par Render
    JAVA_OPTS="-Xms512m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m"

# Construction en mode optimisé
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
