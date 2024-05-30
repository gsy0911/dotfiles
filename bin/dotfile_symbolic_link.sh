IGNORE_PATTERN="^\.(git|config|idea)"

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
echo "create .config/skhd in $HOME"
mkdir -p $HOME/.config/skhd
for dotfile in $(ls -F .config/skhd | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/skhd/$dotfile" "$HOME/.config/skhd/$dotfile"
done

echo "\n================================="
echo "create .config/nvim in $HOME"
mkdir -p $HOME/.config/nvim
for dotfile in $(ls -F .config/nvim | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/nvim/$dotfile" "$HOME/.config/nvim/$dotfile"
done

echo "\n================================="
echo "create .config/karabiner in $HOME"
mkdir -p $HOME/.config/karabiner
ln -snfv "$(pwd)/.config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

echo "Success"