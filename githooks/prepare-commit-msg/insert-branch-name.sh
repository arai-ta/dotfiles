#!/bin/sh
#
# branch: feature/WEB-2248
#                 ^^^^^^^^-- ここをコミットメッセージに入れる

set -eu

if [ -f $1 ] ;then
    mv $1 $1.tmp
fi

git branch | awk '$1 == "*"{n = split($2,a,"/"); printf "%s ", a[n]}' >> $1

if [ -f $1.tmp ] ;then
    cat $1.tmp >> $1
    rm $1.tmp
fi
