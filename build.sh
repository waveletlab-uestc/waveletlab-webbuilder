#!/bin/bash

yarn run build

# shift path

cd public/
git init
git remote add origin git@git.dev.tencent.com:deardrops/waveletlab.git
git branch --set-upstream-to=origin/master master
git add .
git commit -m "page changes"

#git push -f
git push --set-upstream origin master -f

# shift path

cd ..

rm -rf public

clear 

echo "update this commit"

git add .

git commit -m "update"

git push

echo "Done!"



