{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.trilium-desktop
  ];
}
