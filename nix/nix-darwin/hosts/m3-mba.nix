# yoshiki-m3-mba 固有の設定
#
# homebrew.brews / casks / taps は listOf 型のため、
# ここでの定義は ../homebrew.nix の共通定義に「追加」される (上書きではない)。
{...}: {
  homebrew = {
    brews = [
      # このマシンだけに入れる formula をここに書く
      # Database tools
      "tbls"
    ];
    casks = [
      # このマシンだけに入れる cask をここに書く
    ];
    taps = [
      # このマシンだけで使う tap をここに書く
    ];
  };
}
