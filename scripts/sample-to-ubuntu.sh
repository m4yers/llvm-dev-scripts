#!/bin/bash

SAMPLE=${1%/}
shift
HOST="192.168.0.106"
PORT=22
USER=m4yers
FOLDER=/home/m4yers/Development/Projects/llvm-m68k
IDENTITY=~/.ssh/ubuntu

scp $@ -r -i $IDENTITY -P $PORT $SAMPLE $USER@$HOST:$FOLDER
