#!/bin/bash

SAMPLE=${1%/}
shift

pushd $TEST/$SAMPLE > /dev/null

$LLVM/clang -emit-llvm -S \
    -target m680x0-none-linux-gnu \
    -I $GCC_ROOT/usr/include \
    -I $GCC_ROOT/lib/gcc/m68k-elf/6.2.0/include \
    -x c \
    -o $SAMPLE.ll $@ \
    $SAMPLE.c

$CLANG/clang -emit-llvm -S \
    -target i386-none-linux-gnu \
    -I $GCC_ROOT/usr/include \
    -I $GCC_ROOT/lib/gcc/m68k-elf/6.2.0/include \
    -x c \
    -o $SAMPLE.i386.ll $@ \
    $SAMPLE.c

# Produce llvm ir from a C program, it is target specific and since there is
# no m680x0 clang support yet we need to edit it manually before proceeding
# further

# cp $SAMPLE.ll $SAMPLE.ll.tmp
# cat $SAMPLE.ll.tmp         \
#  | sed -e '1,5d'           \
# > $SAMPLE.ll
# rm $SAMPLE.ll.tmp
