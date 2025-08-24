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
    # ../apps/davinci.nix
    ../apps/obs.nix
    ../apps/vlc.nix
  ];
}
