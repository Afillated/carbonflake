{pkgs, inputs, ...}: {
 
  imports = [
    ./grub.nix
    ./plymouth.nix
  ];
}
