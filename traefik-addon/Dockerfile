ARG BUILD_FROM

FROM $BUILD_FROM

ARG TRAEFIK_VERSION

RUN wget -q -O /tmp/traefik.tar.gz \
  "https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_amd64.tar.gz" \
  && tar xzf /tmp/traefik.tar.gz -C /usr/local/bin/ traefik \
  && chmod +x /usr/local/bin/traefik \
  && mkdir -p /etc/traefik \
  && rm -f /tmp/*

COPY rootfs /

LABEL \
  io.hass.name="Traefik Addon (amd64)" \
  io.hass.description="HA Add-on (amd64) for Traefik" \
  maintainer="AckermannM" \
  org.opencontainers.image.title="Traefik Addon (amd64)" \
  org.opencontainers.image.description="HA Add-on (amd64) for Traefik" \
  org.opencontainers.image.vendor="AckermannM" \
  org.opencontainers.image.authors="AckermannM" \
  org.opencontainers.image.url="https://github.com/AckermannM/home-assistant-addons" \
  org.opencontainers.image.source="https://github.com/AckermannM/home-assistant-addons" \
  org.opencontainers.image.documentation="https://github.com/AckermannM/home-assistant-addons/blob/master/traefik-addon/README.md" \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.revision=${BUILD_REF} \
  org.opencontainers.image.version=${BUILD_VERSION}

CMD [ "/init" ]
