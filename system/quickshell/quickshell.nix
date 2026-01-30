{pkgs, inputs, ...}:{
environment.systemPackages = with pkgs; [
    # inputs.quickshell.packages.${pkgs.system}.default
    quickshell
    kdePackages.qtdeclarative
    kdePackages.qt5compat
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtsvg
  ];
  qt.enable = true;
}
