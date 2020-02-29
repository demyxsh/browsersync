#!/usr/bin/dumb-init /bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

# Set default variables
BROWSERSYNC_DOMAIN_MATCH="${BROWSERSYNC_DOMAIN_MATCH:-http://localhost}"
BROWSERSYNC_DOMAIN_RETURN="${BROWSERSYNC_DOMAIN_RETURN:-http://localhost}"
BROWSERSYNC_DOMAIN_SOCKET="${BROWSERSYNC_DOMAIN_SOCKET:-http://localhost}"
BROWSERSYNC_PROXY="${BROWSERSYNC_PROXY:-localhost}"
BROWSERSYNC_FILES="${BROWSERSYNC_FILES:-[\"${BROWSERSYNC_ROOT}/**/*\", \"${BROWSERSYNC_ROOT}/wp-content/plugins/**/*\"]}"
BROWSERSYNC_PORT="${BROWSERSYNC_PORT:-3000}"
BROWSERSYNC_PATH="${BROWSERSYNC_PATH:-/demyx}"
[[ "$BROWSERSYNC_PATH" = false ]] && BROWSERSYNC_PATH=
BROWSERSYNC_PREFIX="${BROWSERSYNC_PREFIX:-/bs}"
[[ "$BROWSERSYNC_PREFIX" = false ]] && BROWSERSYNC_PREFIX=

# Generate bs.js
echo '// Demyx
// https://demyx.sh
// AUTO GENERATED
module.exports={
    ui: false,
    open: false,
    port: '$BROWSERSYNC_PORT',
    files: '$BROWSERSYNC_FILES',
    proxy: '\"$BROWSERSYNC_PROXY\"',
    rewriteRules:[{
        match: /'${BROWSERSYNC_DOMAIN_MATCH/\/\//\\/\\/}'/g,
        fn: function (e,r,t) {
            return '\"${BROWSERSYNC_DOMAIN_RETURN}${BROWSERSYNC_PATH}${BROWSERSYNC_PREFIX}\"'
        }
    }],
    scriptPath: function (path) {
        return '\"${BROWSERSYNC_PATH}${BROWSERSYNC_PREFIX}\"' + path;
    },
    socket: {
        domain: '\"$BROWSERSYNC_DOMAIN_SOCKET\"'
    }
};' > "$BROWSERSYNC_CONFIG"/bs.js

# Disable file watching if BROWSERSYNC_FILES=false
[[ "$BROWSERSYNC_FILES" = false ]] && sed -i 's|files:|//files:|g' "$BROWSERSYNC_CONFIG"/bs.js

browser-sync start --config="$BROWSERSYNC_CONFIG"/bs.js
