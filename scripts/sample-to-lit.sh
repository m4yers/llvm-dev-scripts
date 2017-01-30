#!/bin/bash

FILE=$(realpath $1)
SAMPLE=${FILE##*/}
CONTAINER=${SAMPLE%.*}

pushd $TEST/$CONTAINER > /dev/null
cp $SAMPLE $FILE
$LLVM/llvm-lit --show-all $FILE
