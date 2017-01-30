#!/bin/sh

$GCC/m68k-elf-objdump -xdrgswTW $1 | less
