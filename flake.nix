{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_20
          vscode-langservers-extracted
          typescript

          nodePackages_latest.typescript-language-server
          nodePackages_latest.live-server
          nodePackages_latest.svelte-language-server
        ];

        env = { };
      };
    };
}

