{config, pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [libsForQt5.qt5ct ];
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
