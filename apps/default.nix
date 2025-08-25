{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../apps/spicetify.nix
    ../apps/steam.nix
    ../apps/libreoffice.nix
    ../apps/openshot.nix
    ../apps/obs.nix
    ../apps/vlc.nix
    ];
}
