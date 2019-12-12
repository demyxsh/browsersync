FROM alpine

LABEL sh.demyx.image demyx/browsersync
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Set default variables
ENV BROWSERSYNC_ROOT=/demyx
ENV BROWSERSYNC_CONFIG=/etc/demyx
ENV TZ America/Los_Angeles

# Install main packages
RUN set -ex; \
    apk add --update --no-cache bash dumb-init npm; \
    npm -g install browser-sync

# Create demyx user
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx
    
# Copy entrypoint
COPY demyx.sh /usr/local/bin/demyx

# Finalize
RUN set -ex; \
    install -d -m 0755 -o demyx -g demyx "$BROWSERSYNC_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$BROWSERSYNC_CONFIG"; \
    chmod +x /usr/local/bin/demyx

WORKDIR "$BROWSERSYNC_ROOT"

EXPOSE 3000

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
