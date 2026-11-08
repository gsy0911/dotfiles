# yoshiki-m1-mbp 固有の設定
#
# homebrew.brews / casks / taps は listOf 型のため、
# ここでの定義は ../homebrew.nix の共通定義に「追加」される (上書きではない)。
{...}: {
  homebrew = {
    brews = [
      # このマシンだけに入れる formula をここに書く
      # Languages & Runtimes
      # JavaScript runtime (homebrew-core。1.4.4 で CVE-2026-111497 等が修正済み)
      "bun"
      # Rust
      "rust"
      "rustup"
      "rust-analyzer"
      "rustup-init"

      ### Development Tools
      # Other dev tools
      "snowflake-cli"

      ### Database
      # mysqldump を含む MySQL クライアント (keg-only)
      "mysql-client@8.4"
      # psql を含む PostgreSQL クライアント (keg-only)
      "libpq"

      ### Infrastructure & DevOps
      # Infrastructure as Code
      # homebrew-core の terraform は disabled のため tap を完全修飾で指定
      "hashicorp/tap/terraform"
    ];
    casks = [
      # このマシンだけに入れる cask をここに書く
      "aws-vpn-client"
      # メディアプレイヤー
      "vlc"
    ];
    taps = [
      # このマシンだけで使う tap をここに書く
    ];
  };
}
