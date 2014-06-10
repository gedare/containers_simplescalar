#!/bin/sh
cd $HOME/crosstool-0.42/build/arm-unknown-linux-gnu/gcc-3.3-glibc-2.3.2/build-gcc
make clean
make distclean
# $HOME/crosstool-0.42/build/arm-unknown-linux-gnu/gcc-3.3-glibc-2.3.2/gcc-3.3/configure --target=arm-unknown-linux-gnu --host=i686-host_pc-linux-gnu --prefix=$HOME/crosstool-0.42/build/arm-unknown-linux-gnu/gcc-3.3-glibc-2.3.2/gcc-core-prefix --with-local-prefix=$HOME/crosstool/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/arm-unknown-linux-gnu --disable-multilib --with-newlib --without-headers --disable-nls --enable-threads=no --enable-symvers=gnu --enable-__cxa_atexit --enable-languages=c --disable-shared
$HOME/crosstool-0.42/build/arm-unknown-linux-gnu/gcc-3.3-glibc-2.3.2/gcc-3.3/configure --target=arm-unknown-linux-gnu --host=i686-host_pc-linux-gnu --prefix=$HOME/crosstool/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu --with-headers=$HOME/crosstool/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/arm-unknown-linux-gnu/include --with-local-prefix=$HOME/crosstool/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/arm-unknown-linux-gnu --disable-nls --enable-threads=posix --enable-symvers=gnu --enable-__cxa_atexit --enable-languages=c --enable-shared --enable-c99 --enable-long-long
make all
make install