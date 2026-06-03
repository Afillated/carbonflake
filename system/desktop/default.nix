{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland
    ./kde
    ./quickshell
    ./niri
    ./xdg.nix
    ./theming
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
    ".config/kitty/kitty.conf".text = ''
      include colors.conf
      watch_config no
      background_opacity 1
      scrollbar_handle_opacity 0
      scrollbar never
      window_margin_width 0.0
    '';
  };
}
