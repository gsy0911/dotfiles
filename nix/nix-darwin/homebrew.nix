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

      ## Security/Tools
      "mas"
      "ykman"
      "hudochenkov/sshpass/sshpass"
      "mkcert"
      "nmap"

      ## Git/GitHub
      "gh"
      "ghq"
      "ripgrep"

      ## Image Processing
      "libsixel"
      "imagemagick"
      "cairo"
      "gdk-pixbuf"
      "giflib"
      "jpeg"
      "jpeg-turbo"
      "jpeg-xl"
      "libheif"
      "libpng"
      "libraw"
      "librsvg"
      "libtiff"
      "leptonica"
      "tesseract"
      "webp"
      "zimg"

      ## Video/Audio
      "ffmpeg"
      "flac"
      "lame"
      "libass"
      "libbluray"
      "libde265"
      "libsamplerate"
      "libsndfile"
      "libsoxr"
      "libvidstab"
      "libvmaf"
      "libvorbis"
      "libvpx"
      "mpg123"
      "opencore-amr"
      "opus"
      "rav1e"
      "rubberband"
      "speex"
      "srt"
      "svt-av1"
      "theora"
      "x264"
      "x265"
      "xvid"
      "aom"
      "dav1d"
      "aribb24"

      ## Font/Text Rendering
      "fontconfig"
      "freetype"
      "fribidi"
      "graphite2"
      "pango"

      ## Compression
      "brotli"
      "lz4"
      "lzo"
      "xz"
      "zlib"
      "zstd"
      "libarchive"
      "libdeflate"
      "libzip"
      "snappy"

      ## Networking
      "c-ares"
      "libnghttp2"
      "libssh"
      "libssh2"
      "libwebsockets"
      "rtmpdump"
      "unbound"

      ## Cryptography/Security
      "ca-certificates"
      "gnutls"
      "libfido2"
      "libsodium"
      "libtasn1"
      "mbedtls"
      "mbedtls@3"
      "nettle"

      ## Build Tools/Compilers
      "gcc"
      "gmp"
      "mpfr"
      "m4"
      "pkgconf"
      # "cmake"
      "libtool"
      "pcre2"
      "readline"
      "ncurses"
      "isl"
      "mpdecimal"

      ## System Libraries
      "glib"
      "gettext"
      "libevent"
      "libuv"
      "libyaml"
      "shared-mime-info"
      "sqlite"
      "unibilium"
      "utf8proc"
      "uvwasi"
      "gdbm"

      ## Language Runtimes
      "lua"
      "luajit"
      "luarocks"
      "lpeg"
      "tree-sitter@0.25"

      ## Data Processing
      "hdf5"
      "c-blosc"
      "json-c"
      "cjson"
      "simdjson"
      "protobuf"

      ## Development Tools
      "codex"
      "gemini-cli"
      "typst"
      "xcodegen"
      "snowflake-cli"
      "screenresolution"
      "sketchybar"

      ## X11
      "libx11"
      "libxau"
      "libxcb"
      "libxdmcp"
      "libxext"
      "libxrender"
      "xorgproto"

      ## Other Libraries
      "abseil"
      "frei0r"
      "highway"
      "icu4c@76"
      "icu4c@77"
      "icu4c@78"
      "im-select"
      "imath"
      "ios-deploy"
      "jasper"
      "libb2"
      "libcbor"
      "libgit2"
      "libidn2"
      "liblinear"
      "liblqr"
      "libmicrohttpd"
      "libmpc"
      "libogg"
      "librist"
      "libudfread"
      "libultrahdr"
      "libunibreak"
      "libunistring"
      "little-cms2"
      "oniguruma"
      "openexr"
      "openjpeg"
      "openjph"
      "pixman"
      "sdl2"
      "zimg"
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
