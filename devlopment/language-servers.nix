{ inputs, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    jdt-language-server
    nil
    hyprlang
    marksman
  ];
}
