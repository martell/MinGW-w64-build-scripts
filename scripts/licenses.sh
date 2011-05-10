#!/usr/bin/env bash
set -e

if [ -f install.marker ]
then
    echo "--> Licenses already installed"
else
    echo "--> Copying licenses"
    echo "---> Binutils/GDB"
    mkdir $LICENSE_DIR/binutils
    mkdir $LICENSE_DIR/gdb
    LICENSES="COPYING COPYING.LIB COPYING.LIBGLOSS COPYING.NEWLIB COPYING3 COPYING3.LIB"
    for file in $LICENSES
    do
        cp $SRC_DIR/binutils/file $LICENSE_DIR/binutils/file
        cp $SRC_DIR/gdb/file $LICENSE_DIR/gdb/file
    done

    echo "---> CLooG"
    mkdir $LICENSE_DIR/cloog
    echo "http://www.gnu.org/licenses/lgpl-2.1.html" > $LICENSE_DIR/cloog/license.txt

    echo "---> Expat"
    mkdir $LICENSE_DIR/expat
    cp $SRC_DIR/expat-$EXPAT_VERSION/COPYING $LICENSE_DIR/expat/COPYING

    echo "---> GCC"
    mkdir $LICENSE_DIR/gcc
    LICENSES="COPYING COPYING.LIB COPYING.RUNTIME COPYING3 COPYING3.LIB"
    for file in $LICENSES
    do
        cp $SRC_DIR/gcc/file $LICENSE_DIR/gcc/file
    done

    echo "---> GMP/libiconv"
    mkdir $LICENSE_DIR/gmp
    cp $SRC_DIR/gmp-$GMP_VERSION/COPYING $LICENSE_DIR/gmp/COPYING
    cp $SRC_DIR/gmp-$GMP_VERSION/COPYING.LIB $LICENSE_DIR/gmp/COPYING.LIB

    echo "---> libiconv"
    mkdir $LICENSE_DIR/libiconv
    cp $SRC_DIR/libiconv-$LIBICONV_VERSION/COPYING $LICENSE_DIR/libiconv/COPYING
    cp $SRC_DIR/libiconv-$LIBICONV_VERSION/COPYING.LIB $LICENSE_DIR/libiconv/COPYING.LIB

    echo "---> Make"
    mkdir $LICENSE_DIR/make
    cp $SRC_DIR/make-$MAKE_VERSION/COPYING $LICENSE_DIR/make/COPYING

    echo "---> mingw-w64"
    mkdir $LICENSE_DIR/mingw-w64
    cp $SRC_DIR/mingw-w64/COPYING.MinGW-w64/COPYING.MinGW-w64.txt $LICENSE_DIR/mingw-w64/COPYING.MinGW-w64.txt
    cp $SRC_DIR/mingw-w64/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt $LICENSE_DIR/mingw-w64/COPYING.MinGW-w64-runtime.txt
    cp $SRC_DIR/mingw-w64/COPYING $LICENSE_DIR/mingw-w64/COPYING
    cp $SRC_DIR/mingw-w64/DISCLAIMER $LICENSE_DIR/mingw-w64/DISCLAIMER
    cp $SRC_DIR/mingw-w64/DISCLAIMER.PD $LICENSE_DIR/mingw-w64/DISCLAIMER.PD

    echo "---> MPC"
    mkdir $LICENSE_DIR/mpc
    cp $SRC_DIR/mpc-$MPC_VERSION/COPYING.LIB $LICENSE_DIR/mpc/COPYING.LIB

    echo "--> MPFR"
    mkdir $LICENSE_DIR/mpfr
    cp $SRC_DIR/mpfr-$MPFR_VERSION/COPYING $LICENSE_DIR/mpfr/COPYING
    cp $SRC_DIR/mpfr-$MPFR_VERSION/COPYING.LESSER $LICENSE_DIR/mpfr/COPYING.LESSER
    
    echo "---> PPL"
    mkdir $LICENSE_DIR/ppl
    cp $SRC_DIR/ppl-$PPL_VERSION/COPYING $LICENSE_DIR/ppl/COPYING

    echo "---> Pthreads-Win32"
    mkdir $LICENSE_DIR/pthreads
    cp $BUILD_DIR/pthreads/COPYING $LICENSE_DIR/pthreads/COPYING
    cp $BUILD_DIR/pthreads/COPYING.LIB $LICENSE_DIR/pthreads/COPYING.LIB

    echo "---> Python"
    mkdir $LICENSE_DIR/python
    cp $BUILD_DIR/LICENSE.txt $LICENSE_DIR/python/LICENSE.txt

    echo "---> Done!"
fi
touch install.marker
