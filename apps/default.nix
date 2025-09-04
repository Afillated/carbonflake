{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../apps/spicetify.nix
    ../apps/libreoffice.nix
    ../apps/shotcut.nix
    ../apps/obs.nix
    ../apps/vlc.nix
    ../apps/trilium.nix
    ];
}
