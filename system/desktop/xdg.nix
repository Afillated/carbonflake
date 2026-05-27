{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      gnome-keyring
      xdg-desktop-portal-termfilechooser
    ];
    config.common = {
      default = [
        "termfilechooser"
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [
        "termfilechooser"
        "gtk"
      ];
    };
  };
  hjem.users.carbon.files = {
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source =
      ../../config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh;
  };
}
