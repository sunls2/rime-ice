#!/usr/bin/env bash

set -e

REPO_DIR=${REPO_DIR:-rime-ice}
TARGET_DIR=${TARGET_DIR:-~/Library/Rime}

echo REPO_DIR: "${REPO_DIR}"
echo TARGET_DIR: "${TARGET_DIR}"

[ -e "$REPO_DIR" ] || (echo \'"$REPO_DIR"\' 'repo dir not exist' && exit 1)
[ -e "$TARGET_DIR" ] || (echo \'"$TARGET_DIR"\' 'target dir not exist' && exit 1)

install_files='cn_dicts en_dicts opencc lua
rime.lua
default.yaml
default.custom.yaml
squirrel.yaml
squirrel.custom.yaml
rime_ice.schema.yaml
rime_ice.dict.yaml
double_pinyin_flypy.schema.yaml
double_pinyin_flypy.custom.yaml
symbols_v.yaml
symbols_caps_v.yaml
radical_pinyin.schema.yaml
radical_pinyin.dict.yaml
melt_eng.schema.yaml
melt_eng.dict.yaml
custom_phrase.txt
custom_phrase_double.txt'

for i in $install_files; do
    echo copy: "$REPO_DIR"/"$i" '->' "$TARGET_DIR"/"$i"
    cp -r "$REPO_DIR"/"$i" "$TARGET_DIR"/"$i"
done

echo "done."
