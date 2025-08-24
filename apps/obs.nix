{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.obs-studio
  ];
}
