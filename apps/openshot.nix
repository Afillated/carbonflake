{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
      pkgs.openshot-qt    
  ];
}
