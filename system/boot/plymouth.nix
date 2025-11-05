{
  config,
  pkgs,
  inputs,
  ...
}:
{
  boot = {
    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "mocha"; }) ];
    };

    initrd.kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
  };
}
