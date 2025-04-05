# initial settings

- keyboard
  - キーのリピート速度：速い
  - リピート入力認識までの時間：短い
- trackpad
  - 軌跡の速さ：少し速いにする 
  - 調べる＆データ検出：オフ
  - 副ボタンのクリック：2本指でクリックまたはタップ
  - タップでクリック：有効
- install brew
  - https://brew.sh/index_ja
- install session-manager
  - https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/install-plugin-macos-overview.html
- install Chrome extension
  - https://chrome.google.com/webstore/detail/rename-favbar/djibddceopnloddkfmgekaejflcnadli/related

```shell
# install brew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install required packages
$ brew install go-task ansible

# install from dotfile
$ cd Development
$ mkdir Development/Projects
$ git clone https://github.com/gsy0911/dotfiles.git
$ cd doftiles
$ task dotfile:install
$ task ansible
```

install docker-desktop
add aws credentials
install PyCharm, DataGrip

create GitHub Personal Access Token.
