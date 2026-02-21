# Navigation

- `cdp` / `^p`: `cd "$( ls -1d $HOME/Development/*/* | peco )"`
- `u`: `cd ..`
- `uu`: `cd ../..`

# ls aliases

| alias | command |
|-------|---------|
| `ls` | `ls` or `exa` |
| `l` | `ls -CF` or `exa -F` |
| `ll` | `ls -l` or `exa -l` |
| `la` | `ls -a` or `exa -a` |
| `lla` | `ls -la` or `exa -la` |
| `lt` | `exa -lT --level=2 --git-ignore` |

# zip

```
zip -r NAME.zip FILE_DIR -x "*.DS_Store" "*__MACOSX*"
```
