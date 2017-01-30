#!/bin/bash

SAMPLE=${1%/}
shift

pushd $TEST/$SAMPLE > /dev/null

# Compile M680x0 object
$LLVM/llc \
    -mtriple=m680x0-pc-linux \
    -filetype=obj \
    -debugger-tune=gdb \
    $SAMPLE.ll \
    -o ${SAMPLE}_m680x0.o $@

# Compile i386 object
$CLANG/llc \
    -mtriple=i386-pc-linux \
    -filetype=obj \
    -debugger-tune=gdb \
    $SAMPLE.ll \
    -o ${SAMPLE}_i386.o $@

# Compile M680x0 GCC object
$GCC/m68k-elf-gcc \
    --sysroot=$GCC_ROOT/ \
    -I $GCC_ROOT/usr/include \
    -I $GCC_ROOT/lib/gcc/m68k-elf/6.2.0/include \
    -x c \
    -c $SAMPLE.c \
    -m68000 -g -O0 \
    -o ${SAMPLE}_gcc.o
