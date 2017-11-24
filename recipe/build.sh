#!/bin/bash

if [ "$(uname)" == "Darwin" ]
then
  export CXX="${CXX} -stdlib=libc++"
fi

./configure --prefix=$PREFIX --with-icu --disable-network
make
make check
make install
