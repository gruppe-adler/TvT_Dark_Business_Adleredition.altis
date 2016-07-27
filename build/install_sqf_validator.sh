#!/bin/bash
target=$1
targetdir=`dirname $target`
mkdir -p $targetdir
pushd $targetdir
wget http://gruppe-adler.de/api/travis/sqf_validator.py -O $target
chmod +x $target
popd
