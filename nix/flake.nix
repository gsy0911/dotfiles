{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };



  outputs = { self, nixpkgs, home-manager } @ inputs: let
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
        echo "Updating home-manager..."
        nix run nixpkgs#home-manager -- switch --flake .#myHomeConfig
        echo "Update complete!"
      '');
      };
      homeConfigurations = {
      myHomeConfig = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = system;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
