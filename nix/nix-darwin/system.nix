{ pkgs, lib, inputs, ... }:
{
  system = {
    stateVersion = 6;
    # mac のユーザー名
    primaryUser = "yoshiki";
    homeDirectory = "/Users/yoshiki";
  };
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  # homebrew = {
  #   enable = true;
  #   onActivation.cleanup = "none";
  #   # `brew tap` で確認可能
  #   taps = [ ];
  #   # `brew list --formula` で確認可能
  #   brews = [
  #     "git"
  #   ];
  #   # `brew list --cask` で確認可能
  #   casks = [
  #     "claude"
  #     "visual-studio-code"
  #   ];
  # };
}
