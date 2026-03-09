{pkgs, inputs, ...}:{
environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default
    kdePackages.qtdeclarative
    kdePackages.qt5compat
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
  ];
  qt.enable = true;
}
