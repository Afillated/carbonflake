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
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source = ./yazi-wrapper.sh;
    ".config/mimeapps.list".text = ''
      [Default Applications]
      x-scheme-handler/discord=vesktop.desktop

      x-scheme-handler/http=zen-twilight.desktop
      x-scheme-handler/https=zen-twilight.desktop
      x-scheme-handler/chrome=zen-twilight.desktop
      text/html=zen-twilight.desktop
      application/x-extension-htm=zen-twilight.desktop
      application/x-extension-html=zen-twilight.desktop
      application/x-extension-shtml=zen-twilight.desktop
      application/xhtml+xml=zen-twilight.desktop
      application/x-extension-xhtml=zen-twilight.desktop
      application/x-extension-xht=zen-twilight.desktop

      inode/directory=org.gnome.Nautilus.desktop

      audio/mp3=io.bassi.Amberol.desktop
      audio/mpeg=io.bassi.Amberol.desktop
      audio/x-flac=io.bassi.Amberol.desktop
      audio/*=io.bassi.Amberol.desktop

      video/mp4=mpv.desktop
      video/mpeg=mpv.desktop
      video/x-matroska=mpv.desktop
      video/ogg=mpv.desktop
      video/quicktime=mpv.desktop
      video/webm=mpv.desktop
      video/*=mpv.desktop

    '';
  };
}
