#!/bin/bash
# Demyx
# https://demyx.sh

# Define default variables
[[ -z "$BS_DOMAIN_MATCH" ]] && BS_DOMAIN_MATCH=http://localhost
[[ -z "$BS_DOMAIN_RETURN" ]] && BS_DOMAIN_RETURN=http://localhost
[[ -z "$BS_DOMAIN_SOCKET" ]] && BS_DOMAIN_SOCKET=http://localhost
[[ -z "$BS_PROXY" ]] && BS_PROXY=localhost
[[ -z "$BS_FILES" ]] && BS_FILES="[\"/var/www/html/wp-content/themes/**/*\", \"/var/www/html/wp-content/plugins/**/*\"]"
[[ -z "$BS_PORT" ]] && BS_PORT=3000
[[ -z "$BS_PATH" ]] && BS_PATH=/demyx
[[ "$BS_PATH" = false ]] && BS_PATH=
[[ -z "$BS_PREFIX" ]] && BS_PREFIX=/bs
[[ "$BS_PREFIX" = false ]] && BS_PREFIX=

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
        match: /'${BS_DOMAIN_MATCH/\/\//\\/\\/}'/g,
        fn: function (e,r,t) {
            return '\"${BS_DOMAIN_RETURN}${BS_PATH}${BS_PREFIX}\"'
        }
    }],
    scriptPath: function (path) {
        return '\"${BS_PATH}${BS_PREFIX}\"' + path;
    },
    socket: {
        domain: '\"$BS_DOMAIN_SOCKET\"'
    }
};' > /tmp/bs.js
[[ "$BS_FILES" = false ]] && sed -i 's|files:|//files:|g' /tmp/bs.js

browser-sync start --config=/tmp/bs.js
