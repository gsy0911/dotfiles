{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
       system = "aarch64-darwin";
       pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.my-packages = pkgs.buildEnv {
        name = "my-packages-list";
        paths = [
          pkgs.git
          pkgs.curl
          # ここにパッケージを追記していく
        ];
      };
       apps.${system}.update = {
         type = "app";
         program = toString (pkgs.writeShellScript "update-script" ''
         set -e
         echo "Updating flake..."
         nix flake update
         echo "Updating profile..."
         nix profile upgrade my-packages
         echo "Update complete!"
       '');
       };
  };
}
