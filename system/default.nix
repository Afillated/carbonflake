{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [

    ../system/hyprland/hyprland.nix
    ../system/grub/grub.nix
    ../system/quickshell/quickshell.nix
    ../system/hardware
    ../system/greetd/greetd.nix
    ../system/hjem/hjem.nix
    ../system/shell
  
  ];



  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  fonts.packages = with pkgs;
    [
      font-awesome
      openmoji-color
      twemoji-color-font
      noto-fonts-emoji
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      source-han-sans
      source-han-serif
    ]
    ++ builtins.filter lib.attrsets.isDerivation
    (builtins.attrValues pkgs.nerd-fonts);
}
