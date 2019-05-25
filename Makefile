.PHONY: *

export IMAGE=ivankomolin/arm-tools

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}

pull: 
	docker pull ${IMAGE}

run:
	docker run --rm -it -v ${PWD}/app/:/app/ --privileged -v /dev/bus/usb/:/dev/bus/usb/ ${IMAGE} bash
