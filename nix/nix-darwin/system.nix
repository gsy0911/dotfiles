{
  pkgs,
  lib,
  inputs,
  ...
}: {
  # Determinate Nix が /etc/nix/nix.conf を管理するため nix-darwin 側は無効。
  # nix.enable = false のとき nix.settings は反映されない(設定は /etc/nix/nix.custom.conf へ)。
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
