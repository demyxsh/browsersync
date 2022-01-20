# browsersync
[![demyxsh/browsersync](https://github.com/demyxsh/browsersync/actions/workflows/main.yml/badge.svg)](https://github.com/demyxsh/browsersync/actions/workflows/main.yml)
[![Code Size](https://img.shields.io/github/languages/code-size/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Repository Size](https://img.shields.io/github/repo-size/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Watches](https://img.shields.io/github/watchers/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Stars](https://img.shields.io/github/stars/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Forks](https://img.shields.io/github/forks/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/browsersync?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Alpine](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/browsersync/raw/master/version.json&label=alpine&query=$.alpine&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![OpenSSH](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/browsersync/raw/master/version.json&label=node&query=$.node&color=blue)](https://hub.docker.com/r/demyx/ssh)
[![OpenSSH](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/browsersync/raw/master/version.json&label=browsersync&query=$.browsersync&color=blue)](https://hub.docker.com/r/demyx/ssh)
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
ENTRYPOINT | demyx-entrypoint
TIMEZONE | America/Los_Angeles

## NOTICE
This repository has been moved to the organization [demyxsh](https://github.com/demyxsh); please update the remote URL.
```
git remote set-url origin git@github.com:demyxsh/browsersync.git
```

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
* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://web.libera.chat/?channel=#demyx)
