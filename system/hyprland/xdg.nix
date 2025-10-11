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
    ".config/xdg-desktop-portal-termfilechooser/config".text = ''
      [filechooser]
      cmd=$HOME/.config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
      default_dir=$HOME
      env=TERMCMD=kitty
          EDITOR=hx
            
    '';
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source =../../config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh;
  };

  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };

}
