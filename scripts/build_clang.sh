#!/bin/bash

SCRIPT_NAME=${BASH_SOURCE[0]}

CLANG_HOME=~/packages/clang
SRC_DIR=$CLANG_HOME/llvm_src
BUILD_DIR=$CLANG_HOME/build
INSTALL_DIR=$CLANG_HOME/runtime

echo -e "#"
echo -e "# $SCRIPT_NAME: install necessary packages"
echo -e "#"
sudo apt-get install -y subversion g++ cmake build-essential libffi-dev

echo -e "#"
echo -e "# $SCRIPT_NAME: checkout llvm"
echo -e "#"
mkdir -p $SRC_DIR
cd $SRC_DIR
svn co http://llvm.org/svn/llvm-project/llvm/trunk .

echo -e "#"
echo -e "# $SCRIPT_NAME: checkout clang"
echo -e "#"
cd $SRC_DIR/tools
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang

echo -e "#"
echo -e "# $SCRIPT_NAME: checkout extra clang tools"
echo -e "#"
cd $SRC_DIR/tools/clang/tools
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra

echo -e "#"
echo -e "# $SCRIPT_NAME: checkout compiler-rt"
echo -e "#"
cd $SRC_DIR/projects
svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt

mkdir -p $BUILD_DIR
cd $BUILD_DIR
$SRC_DIR/configure CC=/usr/bin/clang CXX=/usr/bin/clang++ \
    --enable-libcpp --enable-optimized --disable-assertions \
    --prefix=$INSTALL_DIR
make -j 4
make ENABLE_OPTIMIZED=1 DISABLE_ASSERTIONS=1  # release

make update

make check-all

#make install
