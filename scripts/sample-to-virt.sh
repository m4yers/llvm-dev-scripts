#!/bin/bash

SAMPLE=${1%/}
HOST="192.168.0.106"
PORT=10022
USER=root
FOLDER=/root/Development/Projects/llvm-m68k
IDENTITY=~/.ssh/ubuntu

scp -r -i $IDENTITY -P $PORT $SAMPLE $USER@$HOST:$FOLDER
