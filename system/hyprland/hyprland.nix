{ pkgs, inputs, ... }:
let
  hyprlauncher = inputs.hyprlauncher.packages.${pkgs.system}.default;
  grimblast = inputs.hyprland-contrib.packages.${pkgs.system}.grimblast;
in

{

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprland
    kitty
    libnotify
    networkmanagerapplet
    wl-clipboard
    clipse
    playerctl
    hyprpicker
    libqalculate
    hyprpaper
    hyprpolkitagent
    hyprland-qt-support
    hyprcursor
    hyprshot
    mako
    rofi
    wleave
    hyprlauncher
    grimblast
    hyprlock

    bibata-cursors
    nwg-look

    xdg-utils
    glib
    gtk3
    gtk4

    # Additional packages for better cursor support
    gsettings-desktop-schemas # For GTK cursor theme support
    adwaita-icon-theme # Fallback icon theme

  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";

    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";

    # Additional cursor/theme variables for better app support
    # GTK_THEME = "Adwaita:dark"; # Helps with consistent theming
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };

  xdg.portal.enable = true;

  hjem.users.carbon.files = {
    ".config/mako".source = ../../config/mako;
    ".config/rofi".source = ../../config/rofi;
    ".config/hypr".source = ../../config/hypr;
    ".config/kitty".source = ../../config/kitty;

  };
}
