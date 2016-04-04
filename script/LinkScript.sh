#!/bin/sh

# 変数設定
#HOME=$HOME/tmp
MY_DOTS_ROOT=`echo $(cd $(dirname $0)/..;pwd)`

# バージョンチェック入れるよきっと

# ディレクトリ生成
mkdir -p $HOME/.config

# リンクをはる。
ln -sf $MY_DOTS_ROOT/src/.* $HOME
ln -sf $MY_DOTS_ROOT/src/awesome $HOME/.config/
