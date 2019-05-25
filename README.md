# How to use this images

## Run makefile Stm32CubeMx use this image

Save project Stm32CubeMx in ./app and run this command:

```console
$ docker run --rm -it \
	-v ${PWD}/app/:/app/ \ 
	ivankomolin/arm-tools \
	bash -c "make clean && make all"
```
After that, a directory will be created ./app/build/ with firmware files

## Upload firmware in your chip

Example for stm32f0x and stlink-v2

```console
$ docker run --rm -it --privileged \
	-v ${PWD}/app/:/app/ \
	-v /dev/bus/usb/:/dev/bus/usb/ \
	ivankomolin/arm-tools \
	openocd -d0 \
	-f /usr/share/openocd/scripts/interface/stlink-v2.cfg \
	-f /usr/share/openocd/scripts/target/stm32f0x.cfg \
	-c 'init; program /app/build/app.elf; reset run; exit'
```
Firmware /app/build/app.elf created in the above step