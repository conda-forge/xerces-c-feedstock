#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./config

if [[ "${CONDA_BUILD_CROSS_COMPILATION}" == "1" ]]; then
  # needed so missing cross compilation changes to configure.ac
  # get applied
  autoreconf -vfi
fi

./configure --prefix=${PREFIX} \
            --with-icu \
            --with-curl=${PREFIX} \
	    --enable-static=no

make -j${CPU_COUNT} ${VERBOSE_AT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check || (cat tests/test-suite.log && false)
fi
make install
