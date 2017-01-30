#!/bin/bash
# ; RUN: llc < %s -march=x86-64 -mcpu=generic -mtriple=x86_64-linux-gnu -relocation-model=pic \
# ; RUN: llc < %s -emulated-tls -march=x86 -mcpu=generic -mtriple=i386-linux-gnu -relocation-model=pic \


SAMPLE=${1%/}
shift;

pushd $TEST/$SAMPLE > /dev/null

rm ${SAMPLE}_i386.s
$CLANG/llc \
    -emulated-tls \
    -march=x86 \
    -mcpu=generic \
    -mtriple=i386-linux-gnu \
    -filetype=asm \
    $SAMPLE.ll \
    -o ${SAMPLE}_i386.s $@

rm ${SAMPLE}_x86_64.s
$CLANG/llc \
    -march=x86-64 \
    -mcpu=generic \
    -mtriple=x86_64-linux-gnu \
    -filetype=asm \
    $SAMPLE.ll \
    -o ${SAMPLE}_x86_64.s $@

rm ${SAMPLE}_m680x0.s
$LLVM/llc \
    -mtriple=m680x0-linux-gnu \
    -verify-machineinstrs \
    -filetype=asm \
    -view-isel-dags \
    -view-sched-dags \
    $SAMPLE.ll \
    -o ${SAMPLE}_m680x0.s \
    -debug $@
