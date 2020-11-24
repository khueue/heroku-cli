default:
	@ cat ./Makefile

install:
	@ bash ./install.sh

uninstall:
	@ bash ./uninstall.sh

# Path to folder containing `.netrc` file. This will be created and maintained
# by the container for storing Heroku credentials. The actual path doesn't
# really matter.
NETRC_DIR=$(HOME)/.heroku-docker

IMAGE_TAG=heroku-cli-in-docker

# Usage:
# make heroku HEROKU_ARGS="status"
# make heroku HEROKU_ARGS="login"
# make heroku HEROKU_ARGS="logs --app my-app-stage --tail"
heroku: setup build
	@ docker run --interactive --tty --rm --init \
		--mount type="bind",source="$(NETRC_DIR)",target="/root",consistency="delegated" \
		--mount type="bind",source="$(PWD)",target="/workdir",consistency="delegated" \
		$(IMAGE_TAG) \
		$(HEROKU_ARGS)

setup:
	@ mkdir -p $(NETRC_DIR)

build:
	@ docker build --quiet \
		--tag $(IMAGE_TAG) \
		./ > /dev/null
