# yoshiki-m3-mba 固有の設定
#
# homebrew.brews / casks / taps は listOf 型のため、
# ここでの定義は ../homebrew.nix の共通定義に「追加」される (上書きではない)。
{pkgs, ...}: {
  # このマシンだけに入れる nix パッケージをここに書く
  # rye は homebrew-core では 2026-08-18 に disabled のため nixpkgs から入れる
  environment.systemPackages = [
    pkgs.rye
  ];

  homebrew = {
    brews = [
      # このマシンだけに入れる formula をここに書く
      # Database tools
      "tbls"
      # Other dev tools
      "stripe-cli"
    ];
    casks = [
      # このマシンだけに入れる cask をここに書く
      "gcloud-cli"
    ];
    taps = [
      # このマシンだけで使う tap をここに書く
    ];
  };
}
