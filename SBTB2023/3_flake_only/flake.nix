{
  description = "Python example flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = nixpkgs.lib.genAttrs allSystems;

      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });

    in
    {
      # Create your python package
      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in 
        {
          default =
            let
              python = pkgs.python39;
            in
            python.pkgs.buildPythonApplication {
              name = "sbtb";

              buildInputs = with python.pkgs; [ pip ];

              src = ./.;
            };
      });

      # Use the package you created to create your python app
      apps = forAllSystems (system: {
        default = {
          program = "${self.packages.${system}.default}/bin/sbtb";
          type = "app";
        };
      });

      # Your development environment
      devShells = forAllSystems (system: 
        let
          pkgs = nixpkgsFor.${system};
        in  {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ python39 ruff wget ];
            shellHook = ''
              echo "You have entered the wonderful world of nix"
            '';
          };
      });

    };
}
