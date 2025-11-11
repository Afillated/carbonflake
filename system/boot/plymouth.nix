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
    };

    initrd.kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

  };
}
