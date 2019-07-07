#!/bin/bash

./configure --prefix=${PREFIX} \
            --with-icu \
            --enable-static=no

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
