FROM alpine

LABEL sh.demyx.image            demyx/browsersync
LABEL sh.demyx.maintainer       Demyx <info@demyx.sh>
LABEL sh.demyx.url              https://demyx.sh
LABEL sh.demyx.github           https://github.com/demyxco
LABEL sh.demyx.registry         https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                       /demyx
ENV DEMYX_CONFIG                /etc/demyx
ENV DEMYX_DOMAIN_MATCH          http://localhost
ENV DEMYX_DOMAIN_RETURN         http://localhost
ENV DEMYX_DOMAIN_SOCKET         http://localhost
ENV DEMYX_FILES                 "$DEMYX"/**/*
ENV DEMYX_LOG                   /var/log/demyx
ENV DEMYX_PATH                  "$DEMYX"
ENV DEMYX_PORT                  3000
ENV DEMYX_PREFIX                /bs
ENV DEMYX_PROXY                 localhost
ENV TZ                          America/Los_Angeles
# Support for old variables
ENV BROWSERSYNC_CONFIG          "$DEMYX_CONFIG"
ENV BROWSERSYNC_LOG             "$DEMYX_LOG"
ENV BROWSERSYNC_ROOT            "$DEMYX"

# Configure Demyx
RUN set -ex; \
    /usr/sbin/addgroup -g 1000 -S demyx; \
    /usr/sbin/adduser -u 1000 -D -S -G demyx demyx; \
    \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"

# Imports
COPY --chown=demyx:demyx src "$DEMYX_CONFIG"

# Packages
RUN set -ex; \
    /sbin/apk add --update --no-cache bash npm; \
    /usr/bin/npm -g install browser-sync

# Finalize
RUN set -ex; \
    # demyx-entrypoint
    /bin/cp "$DEMYX_CONFIG"/entrypoint.sh /usr/local/bin/demyx-entrypoint; \
    /bin/chmod +x /usr/local/bin/demyx-entrypoint; \
    \
    # Reset permissions
    /bin/chown -R root:root /usr/local/bin

WORKDIR "$DEMYX"

EXPOSE "$DEMYX_PORT"

USER demyx

ENTRYPOINT ["/usr/local/bin/demyx-entrypoint"]
