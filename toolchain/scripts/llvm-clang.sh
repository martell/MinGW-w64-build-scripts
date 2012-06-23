#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
    echo "--> Already configured"
else
    echo "--> Configuring"
    #echo `/usr/bin/env python` --version
	sh cmake -G ninja -DCMAKE_C_COMPILER=$HOST-gcc -DCMAKE_CXX_COMPILER=$HOST-g++ -DCMAKE_BUILD_TYPE=Release   
    #sh $SRC_DIR/LLVM/configure --host=$HOST --build=$BUILD --target=$TARGET --with-sysroot=$PREFIX --prefix=$PREFIX-clang \
    #                           --enable-optimized --disable-assertions --disable-pthreads \
    #                           CFLAGS="$HOST_CFLAGS" LDFLAGS="$HOST_LDFLAGS" \
    #                           > $LOG_DIR/llvm-clang_configure.log 2>&1 || exit 1
    echo "--> Configured"
fi
touch configure.marker

if [ -f build.marker ]
then
    echo "--> Already built"
else
    echo "--> Building"
    make $MAKE_OPTS > $LOG_DIR/llvm-clang_build.log 2>&1 || 
exit 1
fi
touch build.marker

if [ -f install.marker ]
then
    echo "--> Already installed"
else
    echo "--> Installing"
    make $MAKE_OPTS install > $LOG_DIR/llvm-clang_install.log 2>&1 || exit 1
fi
touch install.marker
