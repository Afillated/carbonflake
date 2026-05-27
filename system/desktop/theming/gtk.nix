{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    gtk3
    gtk4
    gsettings-desktop-schemas
    colloid-gtk-theme
    colloid-icon-theme
    glib
    # Additional packages for better cursor support
    gsettings-desktop-schemas # For GTK cursor theme support
    adwaita-icon-theme # Fallback icon theme
  ];

  programs.dconf.enable = true;

  hjem.users.carbon.files = {
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=Colloid-Dark
      gtk-icon-theme-name=Colloid-dark
      gtk-font-name=FiraCode Nerd Font 11
      gtk-cursor-theme-name=Bibata-Modern-Classic
      gtk-cursor-theme-size=24
      gtk-application-prefer-dark-theme=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle=hintslight
      gtk-xft-rgba=rgb
    '';

    ".config/gtk-3.0/gtk.css".text = ''
      @import url("colors.css");
    '';

    ".config/gtk-4.0/gtk.css".text = ''
      @import url("colors.css");
    '';

    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=Colloid-Dark
      gtk-icon-theme-name=Colloid-dark
      gtk-font-name=FiraCode Nerd Font 11
      gtk-cursor-theme-name=Bibata-Modern-Classic
      gtk-cursor-theme-size=24
      gtk-application-prefer-dark-theme=1
    '';
  };
}
