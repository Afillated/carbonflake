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
    nvtopPackages.nvidia
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

  # for wayland compositors
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };
}
