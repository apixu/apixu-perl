.PHONY: build env run test

ifndef APIXUKEY
$(error APIXUKEY is not set)
endif

IMAGE=apixu-perl

build:
	docker build -t $(IMAGE) .

env:
	docker run --rm -ti -v $(CURDIR):/src -w /src -e APIXUKEY=$(APIXUKEY) $(IMAGE) bash

run:
	docker run --rm -ti -v $(CURDIR):/src -w /src -e APIXUKEY=$(APIXUKEY) $(IMAGE) $(FILE)
