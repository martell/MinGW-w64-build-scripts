#!/usr/bin/env bash
set -e

# options
export GCC_LANGUAGES="c,c++,fortran,objc,obj-c++" #java,ada
export BUILD_CORES=2 #used as argument for "make -jn"
export STATIC='--enable-static --disable-shared'
if [[ $HOST == "x86_64-linux-gnu" ]]
then
    export SHARED=$STATIC
else
    export SHARED='--enable-static --enable-shared'
fi
export GNU_MULTILIB='--disable-multilib' #'--enable-multilib --enable-targets=i686-w64-mingw32,x86_64-w64-mingw32'
export GNU_EXTRA_OPTIONS='--disable-nls --disable-werror --enable-lto' #--enable-libgcj

# directories: SRC_DIR contains full source package.
export TOP_DIR=`pwd`
export SRC_DIR=$TOP_DIR/src
export BUILD_DIR=$TOP_DIR/$SHORT_NAME
export LOG_DIR=$BUILD_DIR/logs
export GCC_LIBS=$BUILD_DIR/libs
if [[ "$HOST" == "$TARGET" ]]
then
    export GRAPHITE_LIBS="--with-ppl=$GCC_LIBS --with-cloog=$GCC_LIBS --enable-cloog-backend=isl"
else
    export GRAPHITE_LIBS=
fi
export SCRIPTS=$TOP_DIR/scripts
export PREFIX=$BUILD_DIR/$SHORT_NAME

DIRS_TO_MAKE="$BUILD_DIR $LOG_DIR $PREFIX 
              $GCC_LIBS $GCC_LIBS/include $GCC_LIBS/lib
              $PREFIX/mingw/include $PREFIX/bin $PREFIX/$TARGET/include
              $MARKER_DIR $LICENSE_DIR"
mkdir -p $DIRS_TO_MAKE

# optimized for my system.
export BUILD_CFLAGS='-O2 -mtune=core2 -fomit-frame-pointer -momit-leaf-frame-pointer'
export BUILD_LFLAGS=
export BUILD_CFLAGS_LTO=$BUILD_CFLAGS #' -flto'
export BUILD_LFLAGS_LTO=$BUILD_LFLAGS #' -flto='$BUILD_CORES
export MAKE_OPTS="-j"$BUILD_CORES

# get version info
. ./versions.sh

# create build directories
echo "Creating build directories"
cd $BUILD_DIR
mkdir -p $PROJECTS
cd $TOP_DIR
echo "Building"
for project in $PROJECTS
do
    cd $BUILD_DIR/$project
    echo "-> $project"
    . $SCRIPTS/$project.sh || exit 1
    cd $TOP_DIR
done

