{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hjem/hjem.nix
    ./hjem/users.nix
    ./greetd/greetd.nix
    ./hardware
    ./hyprland
    ./shell
    ./boot
    ./quickshell/quickshell.nix
    ./kde

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
      source-han-sans
      source-han-serif
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    environment.systemPackages = with pkgs; [
      mission-center
      seahorse
    ];

    # Security
    services.gnome.gnome-keyring.enable = true;

}
