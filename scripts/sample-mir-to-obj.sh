#!/bin/bash

SAMPLE=${1%/}
shift;
pushd $TEST/$SAMPLE > /dev/null
$LLVM/llc -mtriple=m680x0-linux-gnu -filetype=obj -start-after=prologepilog $SAMPLE.mir $@ -o $SAMPLE.mir.o
