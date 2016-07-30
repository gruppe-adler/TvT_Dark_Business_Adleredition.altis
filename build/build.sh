#!/bin/bash

currentdir=`dirname $0`

SQF_VALIDATOR="$HOME/usr/bin/sqf_validator.py"
ARMAKE="$HOME/usr/bin/armake"
TAG="$TRAVIS_TAG"
if [[ $TAG == "" ]]
then
	TAG=`node -e 'console.log(JSON.parse(require("fs").readFileSync("package.json")).version)'`
fi

if [[ ! -f "$SQF_VALIDATOR" ]]
then
	"$currentdir/install_sqf_validator.sh" "$SQF_VALIDATOR"
fi
if [[ ! -f "$ARMAKE" ]]
then
	"$currentdir/install_armake.sh" "$ARMAKE"
fi

python3 "$SQF_VALIDATOR"

"$ARMAKE" build -i "$currentdir" -x "build/*" -x ".git/*" -x "cpbo.exe" -x ".travis.yml" -x ".gitattributes" -x ".gitignore" . "$currentdir/../bin/TvT_Dark_Business_Adleredition-$TAG.Altis.pbo"
