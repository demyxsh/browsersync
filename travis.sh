#!/bin/bash
# Demyx
# https://demyx.sh
# https://github.com/peter-evans/dockerhub-description/blob/master/entrypoint.sh
set -euo pipefail
IFS=$'\n\t'

# Get versions
DEMYX_ALPINE_VERSION="$(docker run -t --rm --entrypoint=sh demyx/"$DEMYX_REPOSITORY" | grep VERSION_ID | cut -c 12- | sed 's/\r//g')"
DEMYX_NODE_VERSION="$(docker run -t --rm --entrypoint=node demyx/"$DEMYX_REPOSITORY" --version | sed 's/\r//g')"
DEMYX_BROWSERSYNC_VERSION="$(docker run -t --rm --entrypoint=browser-sync demyx/"$DEMYX_REPOSITORY" --version | sed 's/\r//g')"

# Echo versions to file
echo "DEMYX_ALPINE_VERSION=$DEMYX_ALPINE_VERSION
DEMYX_NODE_VERSION=$DEMYX_NODE_VERSION
DEMYX_BROWSERSYNC_VERSION=$DEMYX_BROWSERSYNC_VERSION" > VERSION

# Replace versions
sed -i "s|alpine-.*.-informational|alpine-${DEMYX_ALPINE_VERSION}-informational|g" README.md
sed -i "s|node-.*.-informational|node-${DEMYX_NODE_VERSION}-informational|g" README.md
sed -i "s|${DEMYX_REPOSITORY}-.*.-informational|${DEMYX_REPOSITORY}-${DEMYX_BROWSERSYNC_VERSION}-informational|g" README.md

# Push back to GitHub
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git remote set-url origin https://${DEMYX_GITHUB_TOKEN}@github.com/demyxco/"$DEMYX_REPOSITORY".git
# Add and commit version file first
git add VERSION
git commit -m "ALPINE $DEMYX_ALPINE_VERSION, NODE $DEMYX_NODE_VERSION, BROWSERSYNC $DEMYX_BROWSERSYNC_VERSION"
# Add and commit the rest
git add .
git commit -m "Travis Build $TRAVIS_BUILD_NUMBER"
git push origin HEAD:master

# Set the default path to README.md
README_FILEPATH="./README.md"

# Acquire a token for the Docker Hub API
echo "Acquiring token"
LOGIN_PAYLOAD="{\"username\": \"${DEMYX_USERNAME}\", \"password\": \"${DEMYX_PASSWORD}\"}"
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d ${LOGIN_PAYLOAD} https://hub.docker.com/v2/users/login/ | jq -r .token)

# Send a PATCH request to update the description of the repository
echo "Sending PATCH request"
REPO_URL="https://hub.docker.com/v2/repositories/${DEMYX_USERNAME}/${DEMYX_REPOSITORY}/"
RESPONSE_CODE=$(curl -s --write-out %{response_code} --output /dev/null -H "Authorization: JWT ${TOKEN}" -X PATCH --data-urlencode full_description@${README_FILEPATH} ${REPO_URL})
echo "Received response code: $RESPONSE_CODE"

if [ $RESPONSE_CODE -eq 200 ]; then
  exit 0
else
  exit 1
fi
