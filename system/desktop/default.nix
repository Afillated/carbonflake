{ pkgs, lib, ... }:
{
  imports = [
    ./hyprland
    ./quickshell
    # ./niri someday, hyprland is just smoother
    ./xdg
    ./theming
    ./scripts
  ];

  environment.systemPackages = with pkgs; [
    kitty
    libnotify
    networkmanagerapplet
    wl-clipboard
    clipse
    playerctl
    nautilus
    bibata-cursors
    xdg-utils
    awww
    elephant
  ];

  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  # for Nautilus
  services.gvfs = {
    enable = true;
  };

  programs.uwsm = {
    enable = true;
  };

  hjem.users.carbon = {
    systemd.services = {
      elephant = {
        description = "Elephant";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        environment.PATH = lib.mkForce "/run/current-system/sw/bin:/etc/profiles/per-user/carbon/bin";
        serviceConfig = {
          ExecStart = "${pkgs.elephant}/bin/elephant";
          Restart = "on-failure";
        };
      };
    };
    files = {
      ".config/kitty/kitty.conf".text = ''
        include colors.conf
        touch_scroll_multiplier 5.0
        background_opacity 1
        scrollbar_handle_opacity 0
        scrollbar never
        window_margin_width 0.0
        remember_window_size no
      '';
      ".config/elephant/elephant.toml".source = (pkgs.formats.toml { }).generate "elephant.toml" {
        ignored_providers = [
          "snippets"
          "unicode"
          "websearch"
          "providerlist"
          "runner"
          "playerctl"
          "bluetooth"
          "files"
          "symbols"
          "windows"
          "wireplumber"
          "todo"
          "archlinuxpkgs"
          "bookmarks"
          "clipboard"
        ];
        providers = {
          default = [
            "desktopapplications"
            "calc"
          ];
        };
      };
    };
  };
}
