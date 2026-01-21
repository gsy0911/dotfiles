{
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix.enable = false;
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
