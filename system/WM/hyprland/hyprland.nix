{ pkgs, inputs, ... }:
let
  grimblast = inputs.hyprland-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast;
  hyprlauncher = inputs.hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default;
  hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  hypr-xdg = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
in

{

  programs.hyprland = {
    enable = true;
    # package = pkgs.hyprland;
    package = hyprland;
    withUWSM = true;
    xwayland.enable = true;
    portalPackage = hypr-xdg;
  };

  environment.systemPackages = with pkgs; [
    hyprpicker
    hyprpaper
    hyprpolkitagent
    hyprland-qt-support
    hyprcursor
    hyprshot
    grimblast
    hyprlock
    hypridle
    hyprlauncher
    hyprtoolkit
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
  };

  hjem.users.carbon.files = {
    ".config/hypr/hyprland.lua".source = ./hyprland.lua;
    ".config/hypr/rules.lua".source = ./rules.lua;
    ".config/hypr/binds.lua".source = ./binds.lua;
    ".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
    ".config/hypr/hypridle.conf".source = ./hypridle.conf;
    ".config/hypr/wallpapers".source = ./wallpapers;
  };
}
