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
      cleanup = "uninstall";
    };
    # caskArgs = {
    #   appdir = "~/Applications";
    # };
    brews = [
      ### Languages & Runtimes
      # Rust
      "rust"
      "rustup"
      "rust-analyzer"
      "rustup-init"
      # Python
      "rye"
      "uv"
      "python@3.10"
      "python@3.11"
      "python@3.12"
      "python@3.13"
      "python@3.14"
      # Node.js
      "node@24"
      "node@20"
      "node"
      "yarn"
      # Lua
      "lua"
      "luajit"
      "luarocks"
      "lpeg"
      # Java
      "openjdk"
      "openjdk@21"
      # Other runtimes
      "tree-sitter"
      "tree-sitter@0.25"

      ### Development Tools
      # Editors & Terminals
      "neovim"
      "vhs"
      "zellij"
      # Terminal utilities
      "neofetch"
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
      "figlet"
      "act"
      "glow"
      "gum"
      "httpie"
      "jc"
      "procs"
      "tree"
      "ttyd"
      "ripgrep"
      # Git tools
      "lazygit"
      "git-flow"
      "gh"
      "ghq"
      # Docker tools
      "lazydocker"
      "oxker"
      "docker-completion"
      # Task runners
      "go-task"
      # Documentation & Writing
      "gemini-cli"
      "typst"
      # Other dev tools
      "jmeter"
      "ollama"
      "xcodegen"
      "snowflake-cli"
      "screenresolution"
      "sketchybar"

      ### Infrastructure & DevOps
      # AWS
      "aws-cdk"
      "awscli"
      "cdktf"
      # Infrastructure as Code
      "terraform"
      # Database
      "mysql"
      # Database tools
      "sqlite"
      "tbls"

      ### System & Security
      # Security tools
      "mas"
      "ykman"
      "hudochenkov/sshpass/sshpass"
      "mkcert"
      "nmap"
      "sshpass"
      # System utilities
      "xdg-ninja"
      "im-select"
      "ios-deploy"

      ### Media Processing
      # Image processing
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
      "jasper"
      "openexr"
      "openjpeg"
      "openjph"
      "libultrahdr"
      "little-cms2"
      "libmng"
      # Video processing
      "ffmpeg"
      "libass"
      "libbluray"
      "libde265"
      "libvidstab"
      "libvmaf"
      "libvpx"
      "rav1e"
      "srt"
      "svt-av1"
      "theora"
      "x264"
      "x265"
      "xvid"
      "aom"
      "dav1d"
      "aribb24"
      "librist"
      "libudfread"
      # Audio processing
      "flac"
      "lame"
      "libsamplerate"
      "libsndfile"
      "libsoxr"
      "libvorbis"
      "mpg123"
      "opencore-amr"
      "opus"
      "rubberband"
      "speex"
      "libogg"
      # Font & Text rendering
      "fontconfig"
      "freetype"
      "fribidi"
      "graphite2"
      "pango"
      "harfbuzz"
      "hunspell"

      ### Core Libraries
      # Build tools & Compilers
      "gcc"
      "gmp"
      "mpfr"
      "m4"
      "pkgconf"
      "cmake"
      "llvm"
      "libomp"
      "libtool"
      "pcre2"
      "readline"
      "ncurses"
      "isl"
      "mpdecimal"
      # System libraries
      "glib"
      "gettext"
      "libevent"
      "libuv"
      "libyaml"
      "shared-mime-info"
      "unibilium"
      "utf8proc"
      "uvwasi"
      "gdbm"
      "dbus"
      "libvterm"
      # Cryptography & Security libraries
      "ca-certificates"
      "gnutls"
      "libfido2"
      "libsodium"
      "libtasn1"
      "mbedtls"
      "mbedtls@3"
      "nettle"
      "p11-kit"
      # Networking libraries
      "c-ares"
      "libnghttp2"
      "libnghttp3"
      "libngtcp2"
      "libssh"
      "libssh2"
      "libwebsockets"
      "rtmpdump"
      "unbound"
      # Compression libraries
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
      "libaec"
      # Data processing
      "hdf5"
      "c-blosc"
      "json-c"
      "cjson"
      "simdjson"
      "protobuf"
      "double-conversion"
      "msgpack"
      # Python dependencies
      "certifi"
      "lapack"
      "libjpeg"
      "openblas"
      "openssl@3"
      "cffi"
      "cryptography"
      "python-certifi"
      "python-cryptography"
      "pycparser"
      "python-markupsafe"
      "python-packaging"
      "python-setuptools"
      "rpds-py"

      ### Graphics & Display
      # X11
      "libx11"
      "libxau"
      "libxcb"
      "libxdmcp"
      "libxext"
      "libxrender"
      "xorgproto"
      # Graphics libraries
      "pixman"
      "sdl2"
      "imath"
      "highway"
      "frei0r"

      ### Other Libraries
      "abseil"
      "icu4c@76"
      "icu4c@77"
      "icu4c@78"
      "libb2"
      "libcbor"
      "libgit2"
      "libidn2"
      "liblinear"
      "liblqr"
      "libmicrohttpd"
      "libmpc"
      "libunibreak"
      "libunistring"
      "oniguruma"
      "gumbo-parser"
      "litehtml"
      "luv"
      "md4c"
      "assimp"
      "z3"
      "zeromq"
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
      "codex"
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
