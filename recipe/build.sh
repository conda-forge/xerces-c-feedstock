#!/bin/bash

if [ "$(uname)" == "Darwin" ]
then
  export CXX="${CXX} -stdlib=libc++"
fi

./configure --prefix=$PREFIX --with-icu --disable-network
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
