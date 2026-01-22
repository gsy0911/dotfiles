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
  home.file.".zshrc".text = ''
    # Managed by Home Manager
    if [ -r "${config.xdg.configHome}/zsh/.zshrc" ]; then
      source "${config.xdg.configHome}/zsh/.zshrc"
    fi
  '';
  home.file.".zshrc".force = true;

  # xdg.configFile."<path>" => ${XDG_CONFIG_HOME}/<path>
  xdg.configFile."aerospace" = {
    source = ./config/aerospace;
    recursive = true;
  };
  xdg.configFile."git" = {
    source = ./config/git;
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
}
