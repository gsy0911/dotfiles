{pkgs, ...}: {
  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  # nix-darwin が /etc/zshrc に自動挿入する `promptinit` を無効化する。
  # promptinit は fpath 内の全 prompt_*_setup ファイルを -r でスキャンするため、
  # /run/current-system 以下の特定ファイルで zsh 起動がハングする原因となる。
  programs.zsh.promptInit = "";

  # compinit のセキュリティチェック (compaudit) を無効化する。
  # compaudit は fpath 内の全ディレクトリのパーミッションを走査するため、
  # /run/current-system 以下のパスで zsh 起動がハングする原因となる。
  # デフォルトの compinit を無効化し、/run/current-system パスを fpath から除外した上で再定義する。
  programs.zsh.enableCompletion = false;
  programs.zsh.interactiveShellInit = ''
    fpath=(''${fpath:#/run/current-system/*})
    autoload -U compinit && compinit -C
  '';
}
