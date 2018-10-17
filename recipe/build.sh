#!/bin/bash

./configure --prefix=$PREFIX --with-icu --disable-network
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
