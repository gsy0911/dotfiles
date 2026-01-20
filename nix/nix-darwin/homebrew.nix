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
      # - vnc-viewer
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
      "aws-vault"
      "docker"
      # other
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
