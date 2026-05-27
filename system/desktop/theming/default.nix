{ pkgs, inputs, ... }:
{
  imports = [
    ./gtk.nix
    ./qt.nix
  ];
}
