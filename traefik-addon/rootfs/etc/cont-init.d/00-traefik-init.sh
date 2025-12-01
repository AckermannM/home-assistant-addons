#!/usr/bin/with-contenv bashio

CONFIG="/data/traefik/traefik.yml"

# Create directories
mkdir -p /data/traefik/dynamic

# If config does not yet exist, copy default
if [ ! -f "$CONFIG" ]; then
  cp /etc/traefik/traefik.default.yml "$CONFIG"
fi

# Inject user values
RESOLVER=$(bashio::config "resolverName")
CASERVER=$(bashio::config "caServer")

bashio::log.info "Using resolverName: ${RESOLVER}"
bashio::log.info "Using caServer: ${CASERVER}"

# Replace placeholders in the config
sed -i "s|__RESOLVER_NAME__|${RESOLVER}|g" "$CONFIG"
sed -i "s|__CA_SERVER__|${CASERVER}|g" "$CONFIG"
