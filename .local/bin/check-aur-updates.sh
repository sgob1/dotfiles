#!/usr/bin/env bash
set -e 

for dir in "/home/sgob/.aur/"*
do
    echo $dir;
    cd $dir;
    echo "Upgrading repository $dir"
    git reset .
    git pull --rebase
    echo ""
    echo ""
    echo "---"
    echo ""
    echo ""
    cd "/home/sgob/.aur"
done

