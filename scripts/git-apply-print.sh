#!/bin/sh

cd "$(dirname "$0")" || exit 
cd ../ || exit # cd to the git repository root

git log --oneline --reverse 84ffe06..dc61691 | sed -r 's/(^\w+\b)/git apply patches\/\1.patch #/'
