{
  config,
  inputs,
  pkgs,
  ...
}:
{
  # imports = [inputs.nix-gaming.nixosModules.pipewireLowLatency];
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pwvucontrol
    alsa-utils
  ];

  # for ags and crackling noises
  hjem.users.carbon.files = {
    # ".config/pipewire".source = ../../config/pipewire;
    ".config/pipewire/pipewire-pulse.d/10-adjustQuirkRules.conf".text = ''
      pulse.rules = [
      	{
      		matches = [
      			{app.process.name = "vesktop"}
      		]
      		actions = {
      			update = {
      				{property = "api.alsa.autoconf.enable" value = "false"}
      			}
      		}
      	}
      ]
    '';
    ".config/pipewire/pipewire.conf.d/pipewire.conf".text = ''
      context.properties = {default.clock.min-quantum = 1024}
    '';
  };
}
