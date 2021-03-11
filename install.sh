IGNORE_PATTERN="^\.(git|config)"

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done

# create .config in $HOME
mkdir -p $HOME/.config
for dotfile in "$(ls .config)"; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/$dotfile" "$HOME/.config/$dotfile"
done

echo "Success"