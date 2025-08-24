{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [

    ../system/hyprland/hyprland.nix
    ../system/shell/nh.nix
    ../system/shell/yazi.nix
    ../system/grub/grub.nix
    ../system/quickshell/quickshell.nix
    ../system/nvidia/nvidia.nix
    ../system/greetd/greetd.nix
  ];
}
