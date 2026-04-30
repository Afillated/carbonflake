{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland
    ./kde
    ./quickshell
    ./niri
    ./gtk.nix
    ./xdg.nix
  ];

  environment.systemPackages = with pkgs; [
    wallust
    kitty
    libnotify
    networkmanagerapplet
    wl-clipboard
    clipse
    playerctl
    rofi
    # mako
    bibata-cursors
    xdg-utils
    glib
    # Additional packages for better cursor support
    gsettings-desktop-schemas # For GTK cursor theme support
    adwaita-icon-theme # Fallback icon theme
  ];

  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  programs.uwsm = {
    enable = true;
  };

  hjem.users.carbon.files = {
    ".config/rofi".source = ../../config/rofi;
    ".config/kitty".source = ../../config/kitty;
  };
}
