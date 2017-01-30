#!/bin/bash

SAMPLE=${1%/}
mkdir $TEST/$SAMPLE
printf "int main() {\n  return 0;\n}" >  $TEST/$SAMPLE/$SAMPLE.c
