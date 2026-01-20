{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
  } @ inputs: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";
    # Enable alternative shell support in nix-darwin.
    # programs.fish.enable = true;
    # Set Git commit hash for darwin-version.
    # system.configurationRevision = self.rev or self.dirtyRev or null;
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    # system.stateVersion = 6;
    # The platform the configuration will be used on.
    # nixpkgs.hostPlatform = "aarch64-darwin";
  in {
    packages.${system}.my-packages = pkgs.buildEnv {
      name = "my-packages-list";
      paths = [
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
        echo "Updating nix-darwin..."
        sudo /run/current-system/sw/bin/darwin-rebuild switch --flake ./flake.nix
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

    darwinConfigurations."yoshiki-m1-mbp" = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [./nix-darwin/config.nix];
    };
    darwinConfigurations."yoshiki-m3-mba" = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [./nix-darwin/config.nix];
    };

    # nix-formatter
    formatter.${system} = pkgs.alejandra;
  };
}
