{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/06278c77b5d162e62df170fec307e83f1812d94b.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
	pkgs.wget
  	pkgs.ruff
	(pkgs.python3.withPackages (ps: [
		ps.pytest	
	]))
  ];

  shellHook = ''
    echo "hello"
  '';

}

