#!/bin/bash

SAMPLE=${1%/}
$TEST/scripts/sample-to-ll.sh   $SAMPLE
$TEST/scripts/sample-to-obj.sh  $SAMPLE
$TEST/scripts/sample-to-virt.sh $SAMPLE
