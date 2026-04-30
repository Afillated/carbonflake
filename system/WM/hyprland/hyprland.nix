{ pkgs, inputs, ... }:
let
  grimblast = inputs.hyprland-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast;
  hyprlauncher = inputs.hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
    ".config/hypr".source = ../../../config/hypr;
  };
}
