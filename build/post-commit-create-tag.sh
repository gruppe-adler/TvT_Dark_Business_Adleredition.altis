#!/bin/bash
package_json=`git rev-parse --show-toplevel`/package.json
version=`git diff HEAD^..HEAD -- $package_json | grep '^\+.*version' | sed -s 's/[^0-9\.]//g'`

if [ "$version" != "" ]; then
	TAG=`node -e "console.log(JSON.parse(require('fs').readFileSync('$package_json')).version)"`
	git tag -a "$TAG" -m "`git log -1 --format=%s`"
	echo "Created a new tag $TAG"
fi

