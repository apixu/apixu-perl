.PHONY: build run clean

IMAGE=weather-app-img
CONTAINER=weather-app

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -ti -v $(CURDIR):/src -w /src --name $(CONTAINER) -p 3000:3000 $(IMAGE)

clean:
	docker rmi $(IMAGE)
