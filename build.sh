#!/bin/bash

# build binutils

curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.19.1.tar.bz2
tar jxvf binutils-2.19.1.tar.bz2
cd binutils-2.19.1
./configure            \
    --target=h8300-elf \
    --disable-nls      \
    --disable-werror   \
    --prefix=../../tools
make && make install

# build gcc

wget http://core.ring.gr.jp/pub/GNU/gcc/gcc-3.4.6/gcc-3.4.6.tar.gz
tar zxvf gcc-3.4.6.tar.gz
cd gcc-3.4.6
vim gcc/collect2.c
wget http://kozos.jp/books/makeos/patch-gcc-3.4.6-x64-h8300.txt
patch -p0 < patch-gcc-3.4.6-x64-h8300.txt
./configure                 \
    --target=h8300-elf      \
    --disable-nls           \
    --disable-threads       \
    --disable-shared        \
    --enable-languages=c    \
    --disable-werror        \
    --prefix=../../tools
export PATH="$PATH:$(pwd)/../../tools/bin"
make && make install

