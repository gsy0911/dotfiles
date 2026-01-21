{
  pkgs,
  lib,
  inputs,
  ...
}: {
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

      ## Languages
      # rust
      "rustup"
      "rust-analyzer"
      # python
      "rye"
      "uv"
      "python@3.10"
      "python@3.11"
      "python@3.12"
      # node
      "node@20"
      "node"
      "yarn"

      ## Python-related
      # for lightgbm
      # "libomp"
      # "cmake"
      # for mecab
      # "mecab"
      # "mecab-ipadic"
      ## for tables(library)
      # after install, you must type: brew link certifi
      "certifi"
      # for scipy
      "lapack"
      ## for matplotlib
      "libjpeg"
      ## for numpy, see: https://github.com/numpy/numpy/issues/17807
      "openblas"
      # for ssh2-python
      "openssl@3"

      ## AWS 
      "aws-cdk"
      "awscli"
      "localstack/tap/localstack-cli"
      # cdktf
      "cdktf"

      ## Database
      # for psycopg2
      # "postgresql"
      "mysql"
      # see: https://github.com/k1LoW/tbls
      "tbls"

      ## IaC
      "terraform"
      # "ansible"
      
      ## Taskfile
      "go-task"
      
      ## Git
      "lazygit"
      "git-flow"
      ## Docker
      "lazydocker"
      "oxker"
      
      ## Terminal
      # neovim
      "neovim"
      "vhs"
      "zellij"
      "neofetch"
      # JankyBorders
      "borders"
      "starship"
      "bat"
      "eza"
      "gawk"
      "jq"
      "fzf"
      "curl"
      "colordiff"
      "tokei"
      "direnv"
      "htop"
      "sheldon"
      # "procs"
      # Ascii Art
      "figlet"

      ## Others
      "mas"
      # basics
      "hdf5"
      "c-blosc"
      # yubikey
      "ykman"
      # sshpass
      "hudochenkov/sshpass/sshpass"
      # for SSL
      "mkcert"
      # portscan
      "nmap"
      "ripgrep"
      "gh"
      "ghq"
      "ollama"
      # font
      # $ img2sixel to show image in terminal
      "libsixel"
      "imagemagick"
      # sketchybar
      # didn't work
      # "sketchybar"
      # JMeter
      # run below after installing openjdk
      # $ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
      # "openjdk
      # "jmeter
      # Gemini
      "gemini-cli"
      "typst"
    ];
    taps = [
      "daipeihust/tap"
      "FelixKratz/formulae"
      "hashicorp/tap"
      "jesseduffield/lazygit"
      "jesseduffield/lazydocker"
      "koekeishiya/formulae"
      "k1low/tap"
      "localstack/tap "
      "nikitabobko/tap"
    ];
    casks = [
      ### GUI Applications
      # AI
      "claude"
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
      # Chat
      "slack"
      # Others
      "adobe-acrobat-reader"
      "insomnia"
      "vlc"
      "minecraft"

      ### Fonts
      "font-cica"
      "font-hack-nerd-font"
      # icons for sketchybar
      "sf-symbols"
      # "font-google-sans-code"
      # "font-jetbrains-mono-nerd-font"
    ];
  };
}
