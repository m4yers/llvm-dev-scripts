#!/bin/bash

SAMPLE=${1%/}
shift;
pushd $TEST/$SAMPLE > /dev/null

$GCC/m68k-elf-objcopy -I elf32-big -j .text -O binary \
    $SAMPLE/$SAMPLE.mir.o \
    $SAMPLE/$SAMPLE.text.bin
