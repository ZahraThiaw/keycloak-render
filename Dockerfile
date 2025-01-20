FROM quay.io/keycloak/keycloak:26.0.8

# Configuration des variables d'environnement par défaut
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    KC_DB=postgres \
    KC_HOSTNAME_STRICT=false \
    KC_HOSTNAME_STRICT_HTTPS=false \
    KC_HTTP_ENABLED=true \
    KC_PROXY=edge

# Construction en mode optimisé
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

# Démarrage en mode optimisé
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
