{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "Scale By the Bay";

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
  '';

  languages.python = {
    enable = true;
    version = "3.11.3";
  };

  services.postgres = {
    enable = true;
    initialDatabases = [{ name = "sbtbdb"; }];
  };

  pre-commit.hooks.black.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
