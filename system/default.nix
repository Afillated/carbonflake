{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hjem/hjem.nix
    ./hardware
    ./shell
    ./boot
    ./desktop
    ./security
  ];

  fonts.packages = with pkgs; [
    hack-font
    fira-code
    noto-fonts
    comfortaa
    nerd-fonts.symbols-only
    noto-fonts-color-emoji
    twemoji-color-font
  ];

  environment.systemPackages = with pkgs; [
    mission-center
  ];
}
