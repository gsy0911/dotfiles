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
# echo "create Library/Application\ Support/lazygit/lazygit in $HOME"
# mkdir -p $HOME/Library/Application\ Support/lazygit
for dotfile in $(ls -F .config/lazygit | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -sf "$(pwd)/.config/lazygit/$dotfile" "$HOME/Library/Application Support/lazygit/$dotfile"
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
mkdir -p $HOME/.config/nvim/lua/plugins
for dotfile in $(ls -F .config/nvim/lua/plugins | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/nvim/lua/plugins/$dotfile" "$HOME/.config/nvim/lua/plugins/$dotfile"
done

echo "\n================================="
echo "create .config/wezterm in $HOME"
mkdir -p $HOME/.config/wezterm
ln -snfv "$(pwd)/.config/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

echo "\n================================="
echo "create .compose in $HOME"
mkdir -p $HOME/.compose
ln -snfv "$(pwd)/docker/compose.yaml" "$HOME/.compose/compose.yaml"

echo "Success"

