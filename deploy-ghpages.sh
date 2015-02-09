#!/bin/bash
rm -rf build || exit 0;
mkdir build;
./node_modules/wintersmith/bin/wintersmith build || exit 0;
( cd build || exit 0;
 git init
 git config user.name "Travis-CI"
 git config user.email "travis@nodemeatspace.com"
 cp ../CNAME ./CNAME
 git add .
 git commit -m "Deployed to Github Pages"
 git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
)