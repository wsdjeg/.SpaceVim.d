#!/bin/sh

./configure \
    --with-features=huge \
    --with-compiledby="wsdjeg" \
    --enable-multibyte \
    --enable-gui=gtk2 \
    --enable-gpm \
    --prefix=/usr \
    --enable-cscope \
    --enable-fontset \
    --enable-sniff \
    --enable-xim \
    --enable-fail-if-missing \
    --enable-mzschemeinterp \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-tclinterp\
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu
