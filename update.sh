#!/bin/bash

set -e

echo "Fetching latests version"

latest=$(curl -s \
	-H "Accept: application/vnd.github.v3+json" \
	"https://api.github.com/repos/syncthing/syncthing/releases/latest" \
	| jq '.tag_name' -r)

echo "Latest version is ${latest}"

sed -i.bak \
	"s/^ARG SYNCTHING_VERSION=.*$/ARG SYNCTHING_VERSION=${latest}/g" \
	Dockerfile

if [[ ! `git status --porcelain` ]]; then
	echo "Syncthing is still up to date"
	exit 0
fi

set -x

git add .
git commit -m "update ${latest}"
git tag -m "syncthing ${latest}" ${latest}
