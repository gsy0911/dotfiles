{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "yoshiki";
in {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  # nvim-treesitter mainブランチのパーサーコンパイルに必要
  home.packages = with pkgs; [
    tree-sitter
  ];

  # symbolic-link
  xdg.enable = true;
  # $ZDOTDIR: zsh
  xdg.configFile."zsh" = {
    source = ./config/zsh;
    recursive = true;
  };
  home.file.".zshenv".text = ''
    # Managed by Home home-manager
    # Only read when ZDOTDIR is not inherited; the real env is $ZDOTDIR/.zshenv
    source "$HOME/.config/zsh/.zshenv"
  '';
  home.file.".zshenv".force = true;
  home.file.".gitconfig" = {
    source = ./home/.gitconfig;
    force = true;
  };
  home.file.".npmrc" = {
    source = ./home/.npmrc;
    force = true;
  };
  # Claude Code settings (MCP servers configuration)
  home.file.".claude/settings.json" = {
    source = ./config/claude/settings.json;
    force = true;
  };
  # Claude Code statusline script
  # https://zenn.dev/kawarimidoll/articles/00cfa200c12c5f
  home.file.".claude/statusline.sh" = {
    source = ./config/claude/statusline.sh;
    executable = true;
    force = true;
  };
  # Claude Code user skill: herdr (available across all projects/machines)
  # Regenerate on herdr upgrades with: herdr --skill > <this source>
  home.file.".claude/skills/herdr/SKILL.md" = {
    source = ./config/claude/skills/herdr/SKILL.md;
    force = true;
  };

  # xdg.configFile."<path>" => ${XDG_CONFIG_HOME}/<path>
  xdg.configFile."aerospace" = {
    source = ./config/aerospace;
    recursive = true;
  };
  home.file.".copilot/copilot-instructions.md".source = ./config/copilot/copilot-instructions.md;
  home.file.".copilot/mcp-config.json".source = ./config/copilot/mcp-config.json;
  xdg.configFile."github-copilot/intellij/mcp.json".source = ./config/copilot/mcp-config.json;
  home.file.".copilot/prompts" = {
    source = ./config/copilot/prompts;
    recursive = true;
  };
  xdg.configFile."git" = {
    source = ./config/git;
    recursive = true;
  };
  xdg.configFile."ghostty" = {
    source = ./config/ghostty;
    recursive = true;
  };
  xdg.configFile."herdr" = {
    source = ./config/herdr;
    recursive = true;
  };
  xdg.configFile."lazygit" = {
    source = ./config/lazygit;
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
  xdg.configFile."sheldon" = {
    source = ./config/sheldon;
    recursive = true;
  };
  xdg.configFile."sketchybar" = {
    source = ./config/sketchybar;
    recursive = true;
  };
  xdg.configFile."starship" = {
    source = ./config/starship;
    recursive = true;
  };
  xdg.configFile."uv" = {
    source = ./config/uv;
    recursive = true;
  };
  xdg.configFile."wezterm" = {
    source = ./config/wezterm;
    recursive = true;
  };
  xdg.configFile."worktrunk" = {
    source = ./config/worktrunk;
    recursive = true;
  };
  xdg.configFile."zellij" = {
    source = ./config/zellij;
    recursive = true;
  };

  xdg.dataFile."man" = {
    source = ./home/man;
    recursive = true;
  };

  # Claude Code の MCP サーバー (user スコープ = ~/.claude.json)
  # Claude Code は settings.json の mcpServers を読まないため、claude mcp で登録する。
  # ~/.claude.json は Claude Code 自身も書き換えるので、ファイルごとリンクはせず
  # 毎回 remove → add-json で入れ直す (冪等)。
  #
  # blender: Blender Lab 公式の MCP (https://www.blender.org/lab/mcp-server/)
  #   PyPI の blender-mcp は非公式版 (ahujasid) なので、公式リポジトリのタグを指定する。
  #   Blender 側にもアドオン (mcp-x.y.z.zip) を入れて、ポート 9876 でサーバーを起動しておく。
  home.activation.claudeMcpServers = lib.hm.dag.entryAfter ["writeBoundary"] ''
    claude="$HOME/.local/bin/claude"
    if [ -x "$claude" ]; then
      run "$claude" mcp remove --scope user blender >/dev/null 2>&1 || true
      run "$claude" mcp add-json --scope user blender ${lib.escapeShellArg (builtins.toJSON {
      type = "stdio";
      command = "uvx";
      args = [
        "--from"
        "git+https://projects.blender.org/lab/blender_mcp.git@v1.0.3#subdirectory=mcp"
        "blender-mcp"
      ];
    })}
    else
      echo "claude が見つからないため MCP サーバーの登録を飛ばしました"
    fi
  '';
}
