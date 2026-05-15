{ inputs, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    jdt-language-server
    nil
    nixd
    hyprlang
    hyprls
    marksman
    lua
    lua-language-server
  ];
}
