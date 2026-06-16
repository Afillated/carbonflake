{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    wallust
  ];
  hjem.users.carbon.files = {
    ".config/wallust/templates".source = ./templates;
    ".config/wallust/wallust.toml".source = (pkgs.formats.toml { }).generate "wallust.toml" {
      backend = "wal";
      palette = "saliencedark16";
      check_contrast = true;
      templates = {
        vencord = {
          template = "midnight.theme.css";
          target = "~/.config/vesktop/themes/midnight-wall.theme.css";
        };
        gtk4 = {
          template = "gtk-colors.css";
          target = "~/.config/gtk-4.0/colors.css";
        };
        gtk3 = {
          template = "gtk-colors.css";
          target = "~/.config/gtk-3.0/colors.css";
        };
        hypr = {
          template = "hyprcolor.lua";
          target = "~/.config/hypr/colors.lua";
        };
        kitty = {
          template = "catcolors.conf";
          target = "~/.config/kitty/colors.conf";
        };
        starship = {
          template = "starship-colors.toml";
          target = "~/.config/starship.toml";
        };
        kvantum = {
          template = "kvantum-colors.kvconfig";
          target = "~/.config/Kvantum/wallust/wallust.kvconfig";
        };
        quickshell = {
          template = "quickshell-colors.qml";
          target = "~/.config/quickshell/theme/Colors.qml";
        };
      };
      hooks = {
        hypr = "hyprctl reload > /dev/null";
        kitty = "kill -10 $(pidof kitty)";
        gtk3 = ''
          dconf write /org/gnome/desktop/interface/gtk-theme \"'Adwaita'\" && \
          sleep 2 && \
          dconf write /org/gnome/desktop/interface/gtk-theme \"'Colloid-Dark'\"
        '';
        gtk4 = ''
          dconf write /org/gnome/desktop/interface/color-scheme "'default'" && \
          sleep 0.3 && \
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'" 
        '';
      };
    };
  };
}
