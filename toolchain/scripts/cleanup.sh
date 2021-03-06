#!/usr/bin/env bash
set -e

if [ -f cleanup.marker ]
then
    echo "--> Already cleaned up"
else
    echo "--> Cleaning up"
    cd $PREFIX
    rm -rf mingw || exit 1
    find . -name \*.la -exec rm -f {} \;

    # move libgcc dll to $PREFIX/bin instead of
    if [ -f "$PREFIX/lib/libgcc_s_sjlj-1.dll" ]
    then
        mv $PREFIX/lib/libgcc_s_sjlj-1.dll $PREFIX/bin/ || exit 1
    fi

    echo "---> Stripping Executables"
    find . -name \*.exe -exec strip {} \;


    if [[ "$TARGET" == "$HOST" ]]
    then
        $HOST-strip $PREFIX-clang/bin/*.exe || exit 1
        $HOST-strip $PREFIX-clang/bin/*.dll || exit 1
        echo "---> Copying and stripping DLL's"
        #cp $GCC_LIBS/bin/*.dll $PREFIX/bin
        $HOST-strip $PREFIX/bin/*.dll || exit 1
        # recopy python dll, stripping it renders it useless
        cp $BUILD_DIR/python/bin/python27.dll $PREFIX/bin/python27.dll || exit 1
    else
        echo "---> No DLL's to copy for cross-compiler"
    fi
    cd $BUILD_DIR/cleanup
fi
touch cleanup.marker
