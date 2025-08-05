{pkgs, inputs, ...}:{
environment.systemPackages = with pkgs.kdePackages; [
    inputs.quickshell.packages.${pkgs.system}.default
    qtdeclarative
    qt5compat
    qtstyleplugin-kvantum
    qtsvg
  ];
}
