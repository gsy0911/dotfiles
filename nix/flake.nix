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
    # googleworkspace-cli.url = "github:googleworkspace/cli";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    # googleworkspace-cli,
  } @ inputs: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};

    # 共通モジュール + ホスト固有モジュール で darwinConfiguration を組み立てる
    mkDarwin = hostModule:
      nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./nix-darwin/config.nix
          hostModule
        ];
      };
  in {
    packages.${system}.my-packages = pkgs.buildEnv {
      name = "my-packages-list";
      paths = [
        pkgs.curl
        # ここにパッケージを追記していく
        # googleworkspace-cli.packages.${system}.default
      ];
    };
    devShells.${system} = {
      # 各プロジェクトの .envrc から
      #   use flake "path:$HOME/Development/Projects/dotfiles/nix#node24"
      # で参照する
      node24 = pkgs.mkShell {
        packages = [
          pkgs.nodejs_24
          # macOS では devShell 内で /usr/bin/git (xcrun ラッパー) が壊れ、
          # zsh の precmd タイトル生成 (.zsh.hooks) が空になるため git を同梱する
          pkgs.git
        ];
      };

      # Node 24 + Python 3.13 (ライブラリは uv 管理)
      node24-py313 = pkgs.mkShell {
        packages = [
          pkgs.nodejs_24
          pkgs.python313
          pkgs.uv
          # devShell 内でも zsh のタブタイトル生成が動くように git を同梱
          pkgs.git
        ];
      };
    };

    apps.${system} = {
      update = {
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

    darwinConfigurations."yoshiki-m1-mbp" = mkDarwin ./nix-darwin/hosts/m1-mbp.nix;
    darwinConfigurations."yoshiki-m3-mba" = mkDarwin ./nix-darwin/hosts/m3-mba.nix;

    # nix-formatter
    formatter.${system} = pkgs.alejandra;
  };
}
