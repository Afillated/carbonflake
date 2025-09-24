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
  ];
}
