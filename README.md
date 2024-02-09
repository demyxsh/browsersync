# browsersync
[![demyxsh/browsersync](https://github.com/demyxsh/browsersync/actions/workflows/main.yml/badge.svg)](https://github.com/demyxsh/browsersync/actions/workflows/main.yml)
[![Code Size](https://img.shields.io/github/languages/code-size/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Repository Size](https://img.shields.io/github/repo-size/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Watches](https://img.shields.io/github/watchers/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Stars](https://img.shields.io/github/stars/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Forks](https://img.shields.io/github/forks/demyxsh/browsersync?style=flat&color=blue)](https://github.com/demyxsh/browsersync)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/browsersync?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Alpine](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/browsersync/raw/master/version.json&label=alpine&query=$.alpine&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Node](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/browsersync/raw/master/version.json&label=node&query=$.node&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Browsersync](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/browsersync/raw/master/version.json&label=browsersync&query=$.browsersync&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux, Node.js, and BrowserSync.

To properly utilize this image, please use [Demyx](https://demyx.sh/readme).
- Repository - [demyxsh/demyx](https://github.com/demyxsh/demyx)
- Homepage - [demyx.sh](https://demyx.sh)

[![Demyx Discord](https://discordapp.com/api/guilds/1152828583446859818/widget.png?style=banner2)](https://demyx.sh/discord)

Join us on Discord for latest news, faster support, or just chill.

<a href="https://demyx.sh/sponsor-buymeacoffee" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

Support this project by buying coffee (please).

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
- Auto built weekly on Saturdays (America/Los_Angeles)
- Rolling release updates
- For support: [Discord](https://demyx.sh/discord)
