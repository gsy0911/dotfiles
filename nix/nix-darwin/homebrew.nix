{
  pkgs,
  lib,
  inputs,
  ...
}: {
  homebrew = {
    enable = true;
    prefix = "/opt/homebrew";
    onActivation = {
      autoUpdate = true;
      cleanup = "none";
    };
    # caskArgs = {
    #   appdir = "~/Applications";
    # };
    brews = [
      ### Languages & Runtimes
      # Python
      "uv"
      "python@3.12"
      # Node.js
      "node@24"
      "volta"
      # Lua
      "luarocks"
      # Java
      "openjdk@25"

      ### Development Tools
      # Editors & Terminals
      "neovim"
      # "vhs"
      "zellij"
      # Terminal utilities
      # "neofetch"
      "fastfetch"
      # "borders"
      "starship"
      "bat"
      "eza"
      "gawk"
      "fzf"
      "curl"
      "colordiff"
      "dyff"
      "tokei"
      "direnv"
      "htop"
      "sheldon"
      "figlet"
      "act"
      "gum"
      "httpie"
      "jc"
      "procs"
      "tree"
      "wget"
      # "ttyd"
      "ripgrep"
      # Git tools
      "lazygit"
      # "git-flow"
      "gh"
      "ghq"
      "worktrunk"
      # Docker tools
      # "lazydocker"
      "oxker"
      # "docker-completion"
      # Task runners
      "go-task"
      # Other dev tools
      # "jmeter"
      # "ollama"
      "xcodegen"
      # "screenresolution"
      "sketchybar"

      ### Infrastructure & DevOps
      # AWS
      "aws-cdk"
      "awscli"
      "ecspresso"
      # Database
      # "mysql"
      "mysql@8.4"

      ### System & Security
      # Security tools
      "mas"
      "ykman"
      "mkcert"
      "nmap"
      # "sshpass"
      # System utilities
      "xdg-ninja"
      "im-select"
      "ios-deploy"
      # vm
      # "cirruslabs/cli/tart"

      ### Media Processing
      # Image processing
      "libsixel"
      "imagemagick"
      "gdk-pixbuf"
      "jpeg"
      "jpeg-xl"
      "libraw"
      "tesseract"
      "zimg"
      "jasper"
      "libultrahdr"
      "libmng"
      # Video processing
      "ffmpeg"
      "libbluray"
      "libvidstab"
      "rav1e"
      "srt"
      "theora"
      "xvid"
      "aribb24"
      "librist"
      # Audio processing
      "libsoxr"
      "opencore-amr"
      "rubberband"
      "speex"
      # Font & Text rendering
      "hunspell"
      # map
      "pmtiles"

      ### Core Libraries
      # Build tools & Compilers
      "cmake"
      # System libraries
      "shared-mime-info"
      "gdbm"
      "dbus"
      "libvterm"
      # Cryptography & Security libraries
      "libfido2"
      "mbedtls"
      # Networking libraries
      "libwebsockets"
      "rtmpdump"
      "unbound"
      # Compression libraries
      "zlib"
      "libzip"
      "snappy"
      # Data processing
      "hdf5"
      "c-blosc"
      "double-conversion"
      "msgpack"
      # Python dependencies
      "lapack"
      "openblas"
      "python-certifi"
      "python-cryptography"
      "rpds-py"

      ### Graphics & Display
      # Graphics libraries
      "frei0r"

      ### Other Libraries
      "liblqr"
      "libunibreak"
      "litehtml"
      "md4c"
      "assimp"
      "zeromq"
    ];
    taps = [
      {
        name = "daipeihust/tap";
        trusted = true;
      }
      {
        name = "felixkratz/formulae";
        trusted = true;
      }
      {
        name = "hashicorp/tap";
        trusted = true;
      }
      {
        name = "jesseduffield/lazygit";
        trusted = true;
      }
      {
        name = "jesseduffield/lazydocker";
        trusted = true;
      }
      {
        name = "koekeishiya/formulae";
        trusted = true;
      }
      {
        name = "k1low/tap";
        trusted = true;
      }
      # "localstack/tap"
      {
        name = "nikitabobko/tap";
        trusted = true;
      }
      {
        name = "kayac/tap";
        trusted = true;
      }
    ];
    casks = [
      ### GUI Applications
      "gcloud-cli"
      # AI
      # "claude"
      "copilot-cli"
      "codex"
      "google-gemini"
      "antigravity"
      "antigravity-ide"

      # terminal
      # "ghostty"
      "wezterm"

      # browser
      "firefox"
      "google-chrome"

      # note
      "obsidian"
      # "notion"
      # "figma"

      # window-manager
      "aerospace"
      # IDE
      "jetbrains-toolbox"
      "visual-studio-code"
      "cursor"
      # Git
      "fork"
      # development
      # "aws-vault-binary"
      "docker-desktop"
      # Chat
      "slack"
      # Others
      "adobe-acrobat-reader"
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
