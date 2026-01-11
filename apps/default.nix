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
    ./cloudflare.nix

  ];

  environment.systemPackages = with pkgs; [
    netbeans
    qbittorrent
    # for app images
    appimage-run
    inputs.akri.packages.${pkgs.system}.default
  ];

  programs.localsend.enable = true;
}
