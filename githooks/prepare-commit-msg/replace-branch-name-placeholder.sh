#!/bin/sh
#
# branch: feature/WEB-2248
#                 ^^^^^^^^-- ここを使ってコミットメッセージ中の
#                            プレースホルダを置換する

set -eux

PLACEHOLDER_REGEX="\[branch-name\]"

ticket=`git branch | awk '$1 == "*"{n = split($2,a,"/"); printf "%s", a[n]}'`

sed -i -e "s@$PLACEHOLDER_REGEX@$ticket@" $1

