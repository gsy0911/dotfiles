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

      # check XDG
      "xdg-ninja"

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
      "python@3.13"
      "python@3.14"

      # node
      "node@24"
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
      # Python packages
      "cffi"
      "cryptography"
      "python-certifi"
      "python-cryptography"

      ## AWS
      "aws-cdk"
      "awscli"
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
      "docker-completion"

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
      "act"
      "glow"
      "gum"
      "httpie"
      "jc"
      "procs"
      "tree"
      "ttyd"

      ## Others
      "mas"
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
      # font
      # $ img2sixel to show image in terminal
      "libsixel"
      "imagemagick"
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

      ## Others
      "abseil"
      "aom"
      "aribb24"
      "brotli"
      "c-ares"
      "ca-certificates"
      "cairo"
      "cjson"
      # "cmake"
      "codex"
      "dav1d"
      "ffmpeg"
      "flac"
      "fontconfig"
      "freetype"
      "frei0r"
      "fribidi"
      "gcc"
      "gdbm"
      "gdk-pixbuf"
      "gettext"
      "giflib"
      "glib"
      "gmp"
      "gnutls"
      "graphite2"
      "highway"
      "icu4c@76"
      "icu4c@77"
      "icu4c@78"
      "im-select"
      "imath"
      "ios-deploy"
      "isl"
      "jasper"
      "jpeg"
      "jpeg-turbo"
      "jpeg-xl"
      "json-c"
      "lame"
      "leptonica"
      "libarchive"
      "libass"
      "libb2"
      "libbluray"
      "libcbor"
      "libde265"
      "libdeflate"
      "libevent"
      "libfido2"
      "libgit2"
      "libheif"
      "libidn2"
      "liblinear"
      "liblqr"
      "libmicrohttpd"
      "libmpc"
      "libnghttp2"
      "libogg"
      "libpng"
      "libraw"
      "librsvg"
      "librist"
      "libsamplerate"
      "libsndfile"
      "libsodium"
      "libsoxr"
      "libssh"
      "libssh2"
      "libtasn1"
      "libtiff"
      "libtool"
      "libudfread"
      "libultrahdr"
      "libunibreak"
      "libunistring"
      "libuv"
      "libvidstab"
      "libvmaf"
      "libvorbis"
      "libvpx"
      "libwebsockets"
      "libx11"
      "libxau"
      "libxcb"
      "libxdmcp"
      "libxext"
      "libxrender"
      "libyaml"
      "libzip"
      "little-cms2"
      "lpeg"
      "lua"
      "luajit"
      "luarocks"
      "lz4"
      "lzo"
      "m4"
      "pkgconf"
      "mbedtls"
      "mbedtls@3"
      "mpdecimal"
      "mpfr"
      "mpg123"
      "ncurses"
      "nettle"
      "oniguruma"
      "opencore-amr"
      "openexr"
      "openjpeg"
      "openjph"
      "opus"
      "pango"
      "pcre2"
      "pixman"
      "protobuf"
      "rav1e"
      "readline"
      "rtmpdump"
      "rubberband"
      "screenresolution"
      "sdl2"
      "shared-mime-info"
      "simdjson"
      "sketchybar"
      "snappy"
      "snowflake-cli"
      "speex"
      "srt"
      "sqlite"
      "svt-av1"
      "tesseract"
      "theora"
      "tree-sitter@0.25"
      "unbound"
      "unibilium"
      "utf8proc"
      "uvwasi"
      "webp"
      "x264"
      "x265"
      "xcodegen"
      "xorgproto"
      "xvid"
      "xz"
      "zimg"
      "zlib"
      "zstd"
    ];
    taps = [
      "daipeihust/tap"
      "FelixKratz/formulae"
      "hashicorp/tap"
      "jesseduffield/lazygit"
      "jesseduffield/lazydocker"
      "koekeishiya/formulae"
      "k1low/tap"
      # "localstack/tap "
      "nikitabobko/tap"
    ];
    casks = [
      ### GUI Applications
      # AI
      "claude"
      "copilot-cli"
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
