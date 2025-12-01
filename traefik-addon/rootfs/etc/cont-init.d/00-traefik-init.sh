#!/usr/bin/with-contenv bashio

CONFIG="/data/traefik/traefik.yml"

# Create directories
mkdir -p /data/traefik/dynamic
mkdir -p /data/traefik/certs

# If config does not yet exist, copy default
if [ ! -f "$CONFIG" ]; then
  cp /etc/traefik/traefik.default.yml "$CONFIG"
fi

# Inject user values
RESOLVER=$(bashio::config "resolverName")
CASERVER=$(bashio::config "caServer")
CAUSERPATH=$(bashio::config "caRootPath")
CATARGET="/data/traefik/certs/root_ca.crt"

bashio::log.info "Using resolverName: ${RESOLVER}"
bashio::log.info "Using caServer: ${CASERVER}"

# Replace placeholders in the config
sed -i "s|__RESOLVER_NAME__|${RESOLVER}|g" "$CONFIG"
sed -i "s|__CA_SERVER__|${CASERVER}|g" "$CONFIG"

# Copy user-provided root CA
if [ -f "$CAUSERPATH" ]; then
  bashio::log.info "Importing Step-CA root certificate from ${CAUSERPATH}"
  cp "$CAUSERPATH" "$CATARGET"
else
  bashio::log.warning "Step-CA root certificate not found at ${CAUSERPATH}"
fi
