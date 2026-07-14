{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nil
    nixd
    hyprlang
    hyprls
    marksman
    lua
    lua-language-server
  ];
}
