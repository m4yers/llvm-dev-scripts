#!/bin/bash

FILE=$(realpath $1)
SAMPLE=${FILE##*/}
SAMPLE=${SAMPLE%.*}

[[ -d $TEST/$SAMPLE ]] || mkdir $TEST/$SAMPLE
pushd $TEST/$SAMPLE > /dev/null
cp $FILE .
