{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [

    ../system/hyprland/hyprland.nix
    ../system/grub/grub.nix
    ../system/quickshell/quickshell.nix
    ../system/nvidia/nvidia.nix
    ../system/greetd/greetd.nix
    ../system/hjem/hjem.nix
    ../system/shell
  ];
  fonts.packages = with pkgs;
    [
      font-awesome
      openmoji-color
      twemoji-color-font
      noto-fonts-emoji
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      source-han-sans
      source-han-serif
    ]
    ++ builtins.filter lib.attrsets.isDerivation
    (builtins.attrValues pkgs.nerd-fonts);
}
