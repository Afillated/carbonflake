{
  config,
  lib,
  pkgs,
  ...
}:
{

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
    brightnessctl
    mangohud
  ];

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
    dynamicBoost.enable = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:100:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
