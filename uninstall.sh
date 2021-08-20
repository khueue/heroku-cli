#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

CLI_EXE_PATH=/usr/local/bin/heroku-cli

rm -f ${CLI_EXE_PATH}

echo "Uninstalled heroku-cli from your PATH, at ${CLI_EXE_PATH}."
