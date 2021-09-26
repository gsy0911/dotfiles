IGNORE_PATTERN="^\.(git|config)"

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done

echo "\n========================"
echo "create .config in $HOME"
mkdir -p $HOME/.config
for dotfile in $(ls -F .config | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/$dotfile" "$HOME/.config/$dotfile"
done

echo "\n================================="
echo "create .config/git in $HOME"
mkdir -p $HOME/.config/git
for dotfile in $(ls -F .config/git | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/git/$dotfile" "$HOME/.config/git/$dotfile"
done

echo "\n================================="
echo "create .config/karabiner in $HOME"
mkdir -p $HOME/.config/karabiner
ln -snfv "$(pwd)/.config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

echo "Success"