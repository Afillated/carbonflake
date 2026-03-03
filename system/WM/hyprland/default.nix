{config, pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./xdg.nix
    ./gtk.nix
  ];
  
}
