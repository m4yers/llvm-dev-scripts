#!/bin/bash

SAMPLE=${1%/}
shift

pushd $TEST/$SAMPLE > /dev/null

$CLANG/clang -emit-llvm -S \
    -target x86_64-none-linux-gnu \
    -I $GCC_NEWLIB_ROOT/usr/include \
    -I $GCC_NEWLIB_ROOT/lib/gcc/m68k-elf/6.2.0/include \
    -I $GCC_NEWLIB_ROOT/m68k-elf/include \
    -x c \
    -o ${SAMPLE}_sim.ll \
    -emit-llvm -S -g -O0 -gdwarf-2 \
    $SAMPLE.c

$LLVM/llc \
    -mtriple=m680x0-pc-linux \
    -filetype=obj \
    -debugger-tune=gdb \
    ${SAMPLE}_sim.ll \
    -o ${SAMPLE}_sim.o

$GCC_NEWLIB/m68k-elf-ld \
    --sysroot=$GCC_NEWLIB_ROOT \
    -L $GCC_NEWLIB_ROOT/lib \
    -L $GCC_NEWLIB_ROOT/lib/gcc/m68k-elf/6.2.0 \
    -L $GCC_NEWLIB_ROOT/m68k-elf/lib/m68000 \
    ${SAMPLE}_sim.o \
    -Am68000 -static -g -T sim.ld \
    -o ${SAMPLE}_sim
