{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./spicetify.nix
    ./media.nix
    ./diskutils.nix
    ./libreoffice.nix
    ./obs.nix
    ./notes.nix
    ./browsers.nix

  ];

  environment.systemPackages = with pkgs; [
    netbeans
    qbittorrent
  ];
}
