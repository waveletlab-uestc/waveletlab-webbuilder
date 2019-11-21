#!/bin/bash

if [ ! -d "./.saber" ]; then
    yarn
fi

yarn run build

# save current dir
current=$(pwd)
# backup to coding

echo -e '\e[0;31;1mPush to coding ...\e[0m'

cd public/
git init
git remote add origin git@git.dev.tencent.com:deardrops/waveletlab.git
git branch --set-upstream-to=origin/master master
git add .
git commit -m "page changes"

#git push -f
git push --set-upstream origin master -f

echo -e '\e[0;31;1mPush to coding complete.\e[0m'

sleep 1s

# push to github(main branch)

echo -e '\e[0;31;1mPush to github ...\e[0m'
# in public/

public=$(pwd)

cd ../../
# check ../../waveletlat-uestc.github.io

if [ ! -d "./waveletlab-uestc.github.io" ]; then
    # get repositories
    git clone git@github.com:waveletlab-uestc/waveletlab-uestc.github.io.git
    target=$(pwd)"waveletlab-uestc.github.io"
else
    cd waveletlab-uestc.github.io
    git pull # update
    target=$(pwd)
fi

# shift to /public
cd $public
# move all the files to target dir

function movefiles() #
{
    for file in $(ls $1); do
        if [ -d $1"/"$file  ]; then
            movefiles $1"/"$file $2"/"$file
        else
            mv -f $1"/"$file $target$2"/"
        fi
    done
    return 0
}

movefiles $public ""

read -s -n1 -p "press any key to continue ..."

# update web
cd $target
git add .
git commit -m "update"
git push

echo -e "\e[0;31;1mPush to github Complete.\e[0m"

# update current repos
cd $current
rm -rf public 
git add .
git commit -m "update"
git push
echo -e "\e[0;31;1mDone!\e[0m"
