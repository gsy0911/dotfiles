# yoshiki-m1-mbp 固有の設定
#
# homebrew.brews / casks / taps は listOf 型のため、
# ここでの定義は ../homebrew.nix の共通定義に「追加」される (上書きではない)。
{...}: {
  homebrew = {
    brews = [
      # このマシンだけに入れる formula をここに書く
      # Languages & Runtimes
      "oven-sh/bun/bun"
      # Rust
      "rust"
      "rustup"
      "rust-analyzer"
      "rustup-init"

      ### Development Tools
      # Other dev tools
      "snowflake-cli"

      ### Infrastructure & DevOps
      # Infrastructure as Code
      # homebrew-core の terraform は disabled のため tap を完全修飾で指定
      "hashicorp/tap/terraform"
    ];
    casks = [
      # このマシンだけに入れる cask をここに書く
      "aws-vpn-client"
    ];
    taps = [
      # このマシンだけで使う tap をここに書く
      {
        name = "oven-sh/bun";
        trusted = true;
      }
    ];
  };
}
