{config, inputs, pkgs, ... }:
{
  imports = [inputs.nix-gaming.nixosModules.pipewireLowLatency];
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    lowLatency = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    pwvucontrol
  ];

  # for ags and crackling noises
  hjem.users.carbon.files = {
    ".config/pipewire".source = ../../config/pipewire;
  };
}
