# browsersync
[![Build Status](https://img.shields.io/travis/demyxco/browsersync?style=flat)](https://travis-ci.org/demyxco/browsersync)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/browsersync?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Alpine](https://img.shields.io/badge/alpine-3.10.3-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Node](https://img.shields.io/badge/node-v10.16.3-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![BrowserSync](https://img.shields.io/badge/browsersync-2.26.7-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/browsersync)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

With each web page, device and browser, testing time grows exponentially. From live reloads to URL pushing, form replication to click mirroring, Browsersync cuts out repetitive manual tasks. It’s like an extra pair of hands. Customise an array of sync settings from the UI or command line to create a personalised test environment. Need more control? Browsersync is easily integrated with your web platform, build tools, and other Node.js projects. https://www.browsersync.io/

DEMYX | BROWSERSYNC
--- | ---
USER | demyx
ENTRYPOINT | ["dumb-init", "browser-sync"]
WORKDIR | /var/www/html
PORT | 3000

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Watches](https://img.shields.io/github/watchers/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Stars](https://img.shields.io/github/stars/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)
[![Forks](https://img.shields.io/github/forks/demyxco/browsersync?style=flat&color=blue)](https://github.com/demyxco/browsersync)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)

## Usage
- The URL will be `http://domain.tld/demyx/bs/`
- Set `BS_PATH=false` and `BS_PREFIX=false` to access BrowserSync without any prefixes
- Image is configured for https://demyx.sh

```
docker run -dt --rm \
--name=browsersync \
--net=demyx \
--volumes-from=wordpress_container \
-e BS_DOMAIN_MATCH=http://localhost \
-e BS_DOMAIN_RETURN=http://localhost \
-e BS_DOMAIN_SOCKET=http://localhost \
-e BS_PROXY=wordpress_container \
-e BS_DOMAIN=domain.tld \
-e BS_FILES="[\"/var/www/html/wp-content/themes/**/*\", \"/var/www/html/wp-content/plugins/**/*\"]" \
-e BS_PATH=/demyx \
-e BS_PREFIX=/bs \
-p 3000:3000 \
demyx/browsersync
```
