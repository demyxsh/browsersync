#!/bin/bash
# Demyx
# https://demyx.sh

# Define default variables
[[ -z "$BS_PROXY" ]] && BS_PROXY=localhost
[[ -z "$BS_DOMAIN" ]] && BS_DOMAIN=domain.tld
[[ -z "$BS_FILES" ]] && BS_FILES="[\"/var/www/html/wp-content/themes/**/*\", \"/var/www/html/wp-content/plugins/**/*\"]"
[[ -z "$BS_PATH" ]] && BS_PATH=/demyx
[[ -z "$BS_PORT" ]] && BS_PORT=3000

# Generate browser-sync's config file
echo '
// AUTO GENERATED
module.exports={
    ui: false,
    open: false,
    port: '$BS_PORT',
    files: '$BS_FILES',
    proxy: '\"$BS_PROXY\"',
    rewriteRules:[{
        match: /'$BS_DOMAIN'/g,
        fn: function (e,r,t) {
            return '\"${BS_DOMAIN}${BS_PATH}/bs\"'
        }
    }],
    scriptPath: function (path) {
        return '\"${BS_PATH}/bs\"' + path;
    },
    socket: {
        domain: '\"$BS_DOMAIN\"'
    }
};' > /tmp/bs.js
[[ "$BS_FILES" = false ]] && sed -i 's|files:|//files:|g' /tmp/bs.js

browser-sync start --config=/tmp/bs.js
