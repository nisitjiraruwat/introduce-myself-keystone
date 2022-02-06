include .env

export TAG=$(shell git describe --always --tags --dirty)
export PACKAGE_TAG=$(shell git log -n 1 --pretty=format:%H -- package-lock.json)

build: build-package
	docker build --no-cache -t $(GIT_URL):$(TAG) --build-arg PACKAGE_TAG=$(PACKAGE_TAG) .

push:
	docker push $(GIT_URL):$(TAG)

build-package:
	@if [ "$(shell docker images -q node:16.13.2-buster-slim-keystonejs-$(PACKAGE_TAG) 2> /dev/null)" = "" ]; then\
		docker build -f Package.Dockerfile --no-cache -t node:16.13.2-buster-slim-keystonejs-$(PACKAGE_TAG) . ; \
	fi
