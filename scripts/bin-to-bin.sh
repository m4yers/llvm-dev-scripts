#!/bin/sh

xxd -b -g0 $1  | cut -d" " -f 2 | tr -d "\n"
