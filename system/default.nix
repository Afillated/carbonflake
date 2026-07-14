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
    ./shell
    ./boot
    ./desktop
  ];

  fonts.packages =
    with pkgs;
    [
      font-awesome
      openmoji-color
      twemoji-color-font
      noto-fonts-color-emoji
      noto-fonts
      noto-fonts-cjk-sans
      comfortaa
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  environment.systemPackages = with pkgs; [
    mission-center
    seahorse
  ];

  # Security
  services.gnome.gnome-keyring.enable = true;
}
