#!/bin/bash
target=$1
targetdir=`dirname $target`
mkdir -p $targetdir
pushd $HOME
git clone https://github.com/KoffeinFlummi/armake && cd armake && make
mv bin/armake $targetdir && chmod 755 $target
cd ..
rm -rf armake
popd
