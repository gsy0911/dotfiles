# initial settings

## macOS

- keyboard
  - キーのリピート速度：速い
  - リピート入力認識までの時間：短い
- trackpad
  - 軌跡の速さ：少し速いにする
  - 調べる＆データ検出：オフ
  - 副ボタンのクリック：2本指でクリックまたはタップ
  - タップでクリック：有効

## install

```shell
# Command Line Tools (git など)
$ xcode-select --install

# Homebrew (パッケージ自体は nix-darwin の homebrew.nix で管理する)
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Nix (Determinate Nix)
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# clone dotfiles
$ mkdir -p ~/Development/Projects
$ cd ~/Development/Projects
$ git clone https://github.com/gsy0911/dotfiles.git
$ cd dotfiles/nix

# nix-darwin (初回のみ。ホスト名は flake.nix の darwinConfigurations から選ぶ)
#   yoshiki-m1-mbp / yoshiki-m3-mba
$ sudo nix run nix-darwin -- switch --flake .#yoshiki-m3-mba

# home-manager (~/.config/* などのシンボリックリンク)
$ nix run nixpkgs#home-manager -- switch --flake .#myHomeConfig
```

新しいマシンを追加する場合は `nix/nix-darwin/hosts/` にファイルを作り、`flake.nix` の `darwinConfigurations` に追加する。
2回目以降は `nix-darwin` が `darwin-rebuild` で動くため、`task` から実行できる。

```shell
$ cd ~/Development/Projects/dotfiles
# flake.lock の更新 + home-manager + nix-darwin + brew upgrade
$ task nix-all
# home-manager のみ反映
$ task nix-symlinks
# gh extension の追加
$ task github
# sketchybar / aerospace の起動
$ task start
```

## after install

- Chrome extension
  - https://chrome.google.com/webstore/detail/rename-favbar/djibddceopnloddkfmgekaejflcnadli/related
- Docker Desktop の初期設定 (アプリ自体は homebrew cask でインストール済み)
- AWS credentials を追加する
- JetBrains Toolbox から PyCharm, DataGrip をインストールする
- GitHub Personal Access Token を作成する (設定先は [README](./README.md#github-pat))
