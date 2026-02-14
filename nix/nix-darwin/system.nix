{
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix = {
    enable = false;
    settings = {
      log-format = "raw";
    };
  };
  system = {
    stateVersion = 6;
    # mac のユーザー名
    primaryUser = "yoshiki";
  };
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
