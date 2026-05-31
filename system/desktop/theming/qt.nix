{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtdeclarative
    kdePackages.qt5compat
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
    kdePackages.qt6ct
    catppuccin-kvantum
  ];
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

  hjem.users.carbon = {
    environment.sessionVariables = {
      QT_STYLE_OVERRIDE = "kvantum";
    };
    files = {
      ".config/Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=wallust
      '';
      ".config/Kvantum/wallust/wallust.svg".source = ./ColloidDark.svg;
    };
  };
}
