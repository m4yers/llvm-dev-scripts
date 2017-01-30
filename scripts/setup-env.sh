export PROJECT=~/Development/Projects/llvm-m68k
export TEST=$PROJECT/test
export CLANG_ROOT=$PROJECT/clang
export CLANG=$CLANG_ROOT/_install/bin

export LLVM_ROOT=$PROJECT/llvm
export LLVM=$LLVM_ROOT/_build/Debug/bin

export GCC_ROOT=~/Development/Projects/gcc-m68k/_install_glibc
export GCC=$GCC_ROOT/bin

export GCC_NEWLIB_ROOT=~/Development/Projects/gcc-m68k/_install_newlib
export GCC_NEWLIB=$GCC_NEWLIB_ROOT/bin

alias snc=$TEST/scripts/sample-new.sh
alias stl=$TEST/scripts/sample-to-ll.sh
alias stg=$TEST/scripts/sample-to-debug.sh
alias std=$TEST/scripts/sample-to-dags.sh
alias sto=$TEST/scripts/sample-to-obj.sh
alias sts=$TEST/scripts/sample-to-sim.sh
alias stv=$TEST/scripts/sample-to-virt.sh
alias stu=$TEST/scripts/sample-to-ubuntu.sh
alias sta=$TEST/scripts/sample-to-all.sh
alias stm=$TEST/scripts/sample-to-mir.sh
alias smta=$TEST/scripts/sample-mir-to-asm.sh
alias smto=$TEST/scripts/sample-mir-to-obj.sh
alias stlit=$TEST/scripts/sample-to-lit.sh
alias sflit=$TEST/scripts/sample-from-lit.sh
alias retest=$TEST/scripts/run-lit.sh
alias obj=$TEST/scripts/object-dump.sh
alias rel=$TEST/scripts/relocations-dump.sh
