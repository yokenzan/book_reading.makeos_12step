#!/bin/bash

DIR=$(pwd)

# build binutils

if [ ! -e binutils-2.19.1.tar.bz2 ]; then
    curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.19.1.tar.bz2
fi

if [ ! -d binutils-2.19.1 ]; then
    tar jxvf binutils-2.19.1.tar.bz2
fi

cd binutils-2.19.1
./configure            \
    --target=h8300-elf \
    --disable-nls      \
    --disable-werror   \
    --prefix=$DIR/tools
make && make install

if [ ! $? = 0 ]; then
    exit 1
fi

# build gcc

if [ ! -e gcc-3.4.6.tar.gz ]; then
    wget http://core.ring.gr.jp/pub/GNU/gcc/gcc-3.4.6/gcc-3.4.6.tar.gz
fi

if [ ! -e gcc-3.4.6.tar.gz ]; then
    tar zxvf gcc-3.4.6.tar.gz
fi

cd gcc-3.4.6
patch -p0 < ../../collect2.c.patch

wget http://kozos.jp/books/makeos/patch-gcc-3.4.6-x64-h8300.txt
patch -p0 < patch-gcc-3.4.6-x64-h8300.txt
./configure                 \
    --target=h8300-elf      \
    --disable-nls           \
    --disable-threads       \
    --disable-shared        \
    --enable-languages=c    \
    --disable-werror        \
    --prefix=$DIR/tools
export PATH="$PATH:$DIR/tools/bin"
make && make install

