{config, pkgs, ...}: {
  imports = [
    ./qt.nix
    ./hyprland.nix
    # ./xdg.nix
  ];
  
}
