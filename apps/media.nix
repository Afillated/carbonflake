{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.vlc
    pkgs.sly
    pkgs.kdePackages.kdenlive
    pkgs.krita
    
  ];
}
