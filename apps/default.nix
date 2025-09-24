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
    ../apps/media.nix
    ../apps/notes.nix
    ../apps/diskutils.nix
    ];
}
