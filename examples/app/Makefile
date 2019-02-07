.PHONY: build run clean

IMAGE=weather-app-img
CONTAINER=weather-app

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -ti -v $(CURDIR):/src -e QUERY=$(QUERY) --name $(CONTAINER) $(IMAGE)

clean:
	docker rmi $(IMAGE)
