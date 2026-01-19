{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    # nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      packages.aarch64-darwin.hello = nixpkgs.legacyPackages.aarch64-darwin.hello;
      packages.aarch64-darwin.default = self.packages.aarch64-darwin.hello;
    };
  in
  {
    # Build darwin flake using:
    # darwinConfigurations."gsy0911-mbp-2021" = nix-darwin.lib.darwinSystem {
    #  modules = [ ./nix-darwin/config.nix ];
    #  specialArgs = { inherit inputs; };
    # };
  };
}
