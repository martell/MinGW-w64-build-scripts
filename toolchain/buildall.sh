#!/usr/bin/env bash
set -e

#echo "Checking sources' availability and up-to-dateness"
#. ./scripts/updatesources.sh || exit 1

echo "Building linux 64-bit to Windows 32-bit cross-compiler"
sh ./buildlinux64mingw32.sh || exit 1
#echo "Building linux 64-bit to Windows 64-bit cross-compiler"
#sh ./buildlinux64mingw64.sh || exit 1
#echo "Building linux 32-bit to Windows 32-bit cross-compiler"
#sh ./buildlinux32mingw32.sh || exit 1
#echo "Building linux 32-bit to Windows 64-bit cross-compiler"
#sh ./buildlinux32mingw64.sh || exit 1

export PATH=$PWD/linux64mingw32/mingw32/bin:$PWD/linux64mingw64/mingw64/bin:$PATH

#echo "Building Windows 64-bit to Windows 64-bit native compiler"
#sh ./buildmingw64mingw64.sh || exit 1
echo "Building Windows 32-bit to Windows 32-bit native compiler"
sh ./buildmingw32mingw32.sh || exit 1
#echo "Building Windows 32-bit to Windows 64-bit native cross-compiler"
#sh ./buildmingw32mingw64.sh || exit 1
#echo "Building Windows 64-bit to Windows 32-bit native cross-compiler"
#sh ./buildmingw64mingw32.sh || exit 1

#echo "Building Cygwin 32-bit to Windows 32-bit cross-compiler"
#sh ./buildcygwin32mingw32.sh || exit 1
#echo "Building Cygwin 32-bit to Windows 64-bit cross-compiler"
#sh ./buildcygwin32mingw64.sh || exit 1

#echo "Building Mac 32-bit to Windows 32-bit cross-compiler"
#sh ./buildmac32mingw32.sh || exit 1
#echo "Building Mac 32-bit to Windows 64-bit cross-compiler"
#sh ./buildmac32mingw64.sh || exit 1
#echo "Building Mac 64-bit to Windows 32-bit cross-compiler"
#sh ./buildmac64mingw32.sh || exit 1
#echo "Building Mac 64-bit to Windows 64-bit cross-compiler"
#sh ./buildmac64mingw64.sh || exit 1

#echo "Building LLVM/Clang 32-bit"
#sh ./buildllvmclang32.sh
#echo "Building LLVM/Clang 64-bit"
#sh ./buildllvmclang64.sh
