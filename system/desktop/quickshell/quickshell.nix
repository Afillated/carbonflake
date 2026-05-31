{pkgs, inputs, ...}:{
environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.qml-niri.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  qt.enable = true;
}
