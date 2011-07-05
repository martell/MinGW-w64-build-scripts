#!/usr/bin/env bash
set -e

# platform information
export HOST=x86_64-linux-gnu
export TARGET=x86_64-w64-mingw32
export BUILD=x86_64-linux-gnu
export EXESUFFIX=
export SHORT_NAME=cross64
export CRT_MULTILIB='--enable-lib64 --disable-lib32'

# Projects to be built, in the right order
export PROJECTS="libiconv expat
                 gmp mpfr mpc ppl cloog
                 mingw-w64-headers
                 binutils
                 gcc-c
                 mingw-w64-crt
                 winpthreads
                 gcc
                 cleanup
                 zipping"

# common build steps
. ./scripts/common.sh
