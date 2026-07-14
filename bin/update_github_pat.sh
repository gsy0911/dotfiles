#!/bin/bash

TC='\e['
Rst="${TC}0m"
Blk="${TC}30m";
Red="${TC}31m";
Grn="${TC}32m";
Yel="${TC}33m";
Blu="${TC}34m";
Prp="${TC}35m";
Cyn="${TC}36m";
Wht="${TC}37m";

if [[ -z "$1" ]]; then
  echo "usage: update_github_pat.sh <new_token>" >&2
  exit 1
fi

new_token="$1"
for dir in "$HOME"/Development/Projects/*/
do
  old_token_url=$(git -C "$dir" config --get remote.origin.url) || continue
  tail=$(echo "$old_token_url" | cut -d "@" -f 2)
  if [[ "$old_token_url" == *"ghp"* ]]; then
    new_token_url="https://$new_token@$tail"
    printf "working @ $dir\n"
    printf "old: $Red$old_token_url$Rst\n"
    printf "new: $Grn$new_token_url$Rst\n\n"
    git -C "$dir" remote set-url origin "$new_token_url"
  fi
done
