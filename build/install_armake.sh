#!/bin/bash
target=$1
targetdir=`dirname $target`
mkdir -p "$targetdir"
pushd $HOME
# git clone https://github.com/KoffeinFlummi/armake && cd armake && make
# mv bin/armake "$targetdir" && chmod 755 $target
#rm -rf armake
# cd ..

wget https://github.com/KoffeinFlummi/armake/releases/download/v0.5.1/armake_v0.5.1.zip
unzip armake_v0.5.1.zip
mv armake_v0.5.1/armake "$targetdir" && chmod 755 $target

popd
