# browsersync
[![Build Status](https://img.shields.io/travis/demyxco/browsersync?style=flat)](https://travis-ci.org/demyxco/browsersync)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/browsersync?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Alpine](https://img.shields.io/badge/alpine-3.12.2-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Node](https://img.shields.io/badge/node-v12.18.4-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![BrowserSync](https://img.shields.io/badge/browsersync-2.26.13-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux, Node.js, and BrowserSync.

DEMYX | BROWSERSYNC
--- | ---
TAGS | latest
PORT | 3000
USER | demyx
WORKDIR | /demyx
CONFIG | /etc/demyx
ENTRYPOINT | /usr/local/bin/demyx-entrypoint
TIMEZONE | America/Los_Angeles

## Usage
- The URL will be `http://domain.tld/demyx/bs/`
- Set `DEMYX_PATH=false` and `DEMYX_PREFIX=false` to access BrowserSync without any prefixes
- Image is configured for https://demyx.sh

```
docker run -dt --rm \
--name=browsersync \
--net=demyx \
--volumes-from=wordpress_container \
-e DEMYX_DOMAIN_MATCH=http://localhost \
-e DEMYX_DOMAIN_RETURN=http://localhost \
-e DEMYX_DOMAIN_SOCKET=http://localhost \
-e DEMYX_PROXY=wordpress_container \
-e DEMYX_FILES="[\"/var/www/html/wp-content/themes/**/*\", \"/var/www/html/wp-content/plugins/**/*\"]" \
-e DEMYX_PORT=3000 \
-e DEMYX_PATH=/demyx \
-e DEMYX_PREFIX=/bs \
-p 3000:3000 \
demyx/browsersync
```

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Watches](https://img.shields.io/github/watchers/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Stars](https://img.shields.io/github/stars/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Forks](https://img.shields.io/github/forks/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)

* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)
