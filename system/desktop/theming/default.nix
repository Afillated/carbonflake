{ pkgs, inputs, ... }:
{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./wallust.nix
  ];
}
