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

# Packages
RUN set -ex; \
    apk add --update --no-cache bash npm; \
    \
    npm -g install browser-sync

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    # Create demyx directories
    install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"; \
    \
    # Update .bashrc
    echo 'PS1="$(whoami)@\h:\w \$ "' > /home/demyx/.bashrc; \
    echo 'PS1="$(whoami)@\h:\w \$ "' > /root/.bashrc

# Imports
COPY --chown=root:root bin /usr/local/bin

# Finalize
RUN set -ex; \
    # Set ownership
    chown -R root:root /usr/local/bin

WORKDIR "$DEMYX"

EXPOSE "$DEMYX_PORT"

USER demyx

ENTRYPOINT ["demyx-entrypoint"]
