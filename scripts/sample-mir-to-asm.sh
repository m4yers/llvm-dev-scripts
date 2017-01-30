#!/bin/bash

SAMPLE=${1%/}
shift;
pushd $TEST/$SAMPLE > /dev/null
$LLVM/llc -mtriple=m680x0-linux-gnu -start-after=prologepilog $SAMPLE.mir $@ -o $SAMPLE.mir.s
