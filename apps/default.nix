{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # ./spicetify.nix
    ./media.nix
    ./diskutils.nix
    ./libreoffice.nix
    ./obs.nix
    ./notes.nix
    ./browsers.nix
    ./cloudflare.nix

  ];

  environment.systemPackages = with pkgs; [
    qbittorrent
    # for app images
    appimage-run
  ];

  programs.localsend.enable = true;
}
