{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hjem/hjem.nix
    ./greetd/greetd.nix
    ./hardware
    ./hyprland
    ./shell
    ./boot
    ./quickshell/quickshell.nix

  ];

  fonts.packages =
    with pkgs;
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
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
