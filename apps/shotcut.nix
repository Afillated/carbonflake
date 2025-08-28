{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
      pkgs.shotcut    
  ];
}
