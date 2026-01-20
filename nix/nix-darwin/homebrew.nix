{ pkgs, lib, inputs, ... }:
{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    onActivation = {
      autoUpdate = true;
      # TODO: いずれ uninstall
      cleanup = "none";
    };
    # caskArgs = {
    #   appdir = "~/Applications";
    # };
    brews = [
      ### CLI Applications not available in nixpkgs
      "htop"
      "sheldon"
      # "ansible"
      "mas"
      # basics
      "bat"
      "eza"
      "gawk"
      "jq"
      "fzf"
      "curl"
      "starship"
      "colordiff"
      "tokei"
      "direnv"
      "procs"
      "figlet"
      # Taskfile
      "go-task"
      # rust
      "rustup"
      "rust-analyzer"
      # aws
      "aws-cdk"
      "awscli"
      "localstack/tap/localstack-cli"
      # cdktf
      "cdktf"
      "terraform"
      # node
      "node@20"
      "node"
      "yarn"
      # python
      "rye"
      "uv"
      "python@3.10"
      "python@3.11"
      "python@3.12"
      # after install, you must type: brew link certifi
      "certifi"
      ## for scipy
      "lapack"
      ## for matplotlib
      "libjpeg"
      ## for psycopg2
      # "postgresql"
      "mysql"
      # see: https://github.com/k1LoW/tbls
      "tbls"
      ## for numpy, see: https://github.com/numpy/numpy/issues/17807
      "openblas"
      ## for lightgbm
      "libomp"
      # "cmake"
      ## for mecab
      "mecab"
      "mecab-ipadic"
      ## for tables(library)
      "hdf5"
      "c-blosc"
      # yubikey
      "ykman"
      # sshpass
      "hudochenkov/sshpass/sshpass"
      # for ssh2-python
      "openssl@3"
      # for SSL
      "mkcert"
      # portscan
      "nmap"
      # neovim
      "neovim"
      "ripgrep"
      "vhs"
      "gh"
      "ghq"
      "ollama"
      "zellij"
      # font
      # $ img2sixel to show image in terminal
      "libsixel"
      "imagemagick"
      # Git
      "lazygit"
      "git-flow"
      # Docker
      "lazydocker"
      "oxker"
      # sketchybar
      # didn't work
      # "sketchybar"
      # JMeter
      # run below after installing openjdk
      # $ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
      # "openjdk
      # "jmeter
      "neofetch"
      # JankyBorders
      "borders"
      # Gemini
      "gemini-cli"
      # Others
      "typst"
    ];
    taps = [
      "nikitabobko/tap"
    ];
    casks = [
      ### GUI Applications
      "font-cica"
      # icons for sketchybar
      "font-hack-nerd-font"
      "sf-symbols"
      # claude
      "claude"
      # "claude-code"
      # # VNC
      # "vnc-viewer
      # terminal
      "ghostty"
      "wezterm"
      # browser
      "firefox"
      "google-chrome"
      # note
      "obsidian"
      "notion"
      # window-manager
      "aerospace"
      # IDE
      "jetbrains-toolbox"
      "visual-studio-code"
      "cursor"
      # Git
      "fork"
      # development
      "aws-vault-binary"
      "docker-desktop"
      # Others
      "adobe-acrobat-reader"
      "insomnia"
      "vlc"
      "minecraft"

      ### Fonts
      # "font-google-sans-code"
      # "font-jetbrains-mono-nerd-font"
    ];
  };

}
