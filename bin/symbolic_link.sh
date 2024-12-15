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

# echo "\n================================="
# echo "create .config/skhd in $HOME"
# mkdir -p $HOME/.config/skhd
# for dotfile in $(ls -F .config/skhd | grep -v /); do
#     [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
#     ln -snfv "$(pwd)/.config/skhd/$dotfile" "$HOME/.config/skhd/$dotfile"
# done

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
echo "create .config/sheldon in $HOME"
mkdir -p $HOME/.config/sheldon
ln -snfv "$(pwd)/.config/sheldon/plugins.toml" "$HOME/.config/sheldon/plugins.toml"

echo "\n================================="
echo "create .config/aerospace in $HOME"
mkdir -p $HOME/.config/aerospace
ln -snfv "$(pwd)/.config/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"


echo "\n================================="
echo "create .config/sketchybar in $HOME"
mkdir -p $HOME/.config/sketchybar/plugins
ln -snfv "$(pwd)/.config/sketchybar/sketchybarrc" "$HOME/.config/sketchybar/sketchybarrc"
for dotfile in $(ls -F .config/sketchybar/plugins | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/sketchybar/plugins/$dotfile" "$HOME/.config/sketchybar/plugins/$dotfile"
done

# echo "\n================================="
# echo "create ./.hammerspoon in $HOME"
# mkdir -p $HOME/.hammerspoon
# ln -snfv "$(pwd)/.config/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"
# ln -snfv "$(pwd)/.config/hammerspoon/ctrlDoublePress.lua" "$HOME/.hammerspoon/ctrlDoublePress.lua"

echo "\n================================="
echo "create .compose in $HOME"
mkdir -p $HOME/.compose
ln -snfv "$(pwd)/docker/compose.yaml" "$HOME/.compose/compose.yaml"

echo "Success"

