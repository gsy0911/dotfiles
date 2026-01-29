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

  # symbolic-link
  xdg.enable = true;
  # $ZDOTDIR: zsh
  xdg.configFile."zsh" = {
    source = ./config/zsh;
    recursive = true;
  };
  home.file.".zshenv".text = ''
    # Managed by Home home-manager
    # XGD Base Directory
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_STATE_HOME=$HOME/.local/state
    export XDG_CACHE_HOME=$HOME/.cache
    export ZDOTDIR=$XDG_CONFIG_HOME/zsh
  '';
  home.file.".zshenv".force = true;

  # xdg.configFile."<path>" => ${XDG_CONFIG_HOME}/<path>
  xdg.configFile."aerospace" = {
    source = ./config/aerospace;
    recursive = true;
  };
  xdg.configFile."copilot" = {
    source = ./config/copilot;
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
  xdg.configFile."wezterm" = {
    source = ./config/wezterm;
    recursive = true;
  };
  xdg.configFile."zellij" = {
    source = ./config/zellij;
    recursive = true;
  };
}
