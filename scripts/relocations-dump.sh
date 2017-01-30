#!/bin/bash

$LLVM/llvm-readobj -relocations -elf-output-style=GNU $@
