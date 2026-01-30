{ pkgs, inputs, ... }:
let
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
    rofi
    wleave
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
    GTK_THEME = "Adwaita:dark"; # Helps with consistent theming
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  programs.uwsm = {
    enable = true;
  };

  xdg.portal.enable = true;

  hjem.users.carbon.files = {
    ".config/rofi".source = ../../config/rofi;
    ".config/hypr".source = ../../config/hypr;
    ".config/kitty".source = ../../config/kitty;
    ".config/wleave/layout.json".text = ''
                  {
          "buttons": [
              {
                  "label": "lock",
                  "action": "hyprlock",
                  "text": "Lock",
                  "keybind": "l",
                  "icon": "/nix/store/ps4g1ycniza09pasqfy8l0lqhl189avl-wleave-0.6.2/share/wleave/icons/lock.svg"
              },
              {
                  "label": "hibernate",
                  "action": "systemctl hibernate",
                  "text": "Hibernate",
                  "keybind": "h",
                  "icon": "/nix/store/ps4g1ycniza09pasqfy8l0lqhl189avl-wleave-0.6.2/share/wleave/icons/hibernate.svg"
              },
              {
                  "label": "logout",
                  "action": "loginctl terminate-user $USER",
                  "text": "Logout",
                  "keybind": "e",
                  "icon": "/nix/store/ps4g1ycniza09pasqfy8l0lqhl189avl-wleave-0.6.2/share/wleave/icons/logout.svg"
              },
              {
                  "label": "shutdown",
                  "action": "systemctl poweroff",
                  "text": "Shutdown",
                  "keybind": "s",
                  "icon": "/nix/store/ps4g1ycniza09pasqfy8l0lqhl189avl-wleave-0.6.2/share/wleave/icons/shutdown.svg"
              },
              {
                  "label": "suspend",
                  "action": "systemctl suspend",
                  "text": "Suspend",
                  "keybind": "u",
                  "icon": "/nix/store/ps4g1ycniza09pasqfy8l0lqhl189avl-wleave-0.6.2/share/wleave/icons/suspend.svg"
              },
              {
                  "label": "reboot",
                  "action": "systemctl reboot",
                  "text": "Reboot",
                  "keybind": "r",
                  "icon": "/nix/store/ps4g1ycniza09pasqfy8l0lqhl189avl-wleave-0.6.2/share/wleave/icons/reboot.svg"
              }
          ]
      }

                  
    '';

  };
}
