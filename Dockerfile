FROM alpine

LABEL sh.demyx.image demyx/browsersync
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Install main packages
RUN set -ex; \
    apk add --update --no-cache dumb-init npm bash; \
    npm -g install browser-sync

# Create demyx user
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx
    
# Copy entrypoint
COPY demyx.sh /usr/local/bin/demyx

# Finalize
RUN set -ex; \
    mkdir -p /var/www/html; \
    chown demyx:demyx /var/www/html; \
    chmod +x /usr/local/bin/demyx

WORKDIR /var/www/html

EXPOSE 3000

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
