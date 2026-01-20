{ pkgs, lib, inputs, ... }:
{
  homebrew = {
    enable = true;
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
      # "fisher"
    ];
    taps = [
      # "nikitabobko/tap"
    ];
    casks = [
      ### GUI Applications
      # "wezterm"
      # "1password"
      # "1password-cli"
      "aerospace"
      "cursor"
      # "firefox"
      "obsidian"
      # "raycast"
      # "stats"
      # "shottr"
      # "notchnook"
      # "jordanbaird-ice"
      # "kap"
      # "keycastr"
      # "zed"
      # "arc"

      ### Fonts
      # "font-google-sans-code"
      # "font-jetbrains-mono-nerd-font"
    ];
  };

}
