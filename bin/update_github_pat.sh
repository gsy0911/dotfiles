
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

new_token="$( echo $1 )"
dirs="$( ls -1d $HOME/Development/Projects/* )"
for dir in $dirs
do
  cd $dir
  old_token_url=$(git config --get remote.origin.url)
  tail=$(echo $old_token_url | cut -d "@" -f 2)
  if [[ "$old_token_url" == *"ghp"* ]]; then
    new_token_url="https://$new_token@$tail"
    printf "working @ $dir\n"
    printf "old: $Red$old_token_url$Rst\n"
    printf "new: $Grn$new_token_url$Rst\n\n"
    git remote set-url origin $new_token_url
  fi
done

