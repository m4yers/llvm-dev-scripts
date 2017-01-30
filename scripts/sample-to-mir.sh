#!/bin/bash

SAMPLE=${1%/}
shift;
pushd $TEST/$SAMPLE > /dev/null
$LLVM/llc -mtriple=m680x0-linux-gnu -stop-after=prologepilog $@ $SAMPLE.ll -o $SAMPLE.mir
