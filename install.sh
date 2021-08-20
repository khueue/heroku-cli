#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

MAKEFILE_DIR=$(
	cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1
	pwd
)

CLI_EXE_PATH=/usr/local/bin/heroku-cli

cat <<EOF > ${CLI_EXE_PATH}
#!/usr/bin/env bash
HEROKU_ARGS="\$@" make -C "${MAKEFILE_DIR}" heroku
EOF

chmod +x ${CLI_EXE_PATH}

echo "Installed heroku-cli to your PATH, at ${CLI_EXE_PATH}."
echo "Uninstall with: make uninstall"
echo
echo "Usage:"
echo "$ heroku-cli login"
echo "$ heroku-cli logs --app my-app"
