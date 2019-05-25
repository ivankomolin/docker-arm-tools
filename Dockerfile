FROM debian:9 as build

WORKDIR app

RUN apt-get update && apt-get install -y \
	gcc-arm-none-eabi \
	openocd \
	make
