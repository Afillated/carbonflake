{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vlc
    kdePackages.kdenlive
    krita
    amberol
    (mpv.override {
      scripts = [
        mpvScripts.mpv-playlistmanager
        mpvScripts.memo
        mpvScripts.mpris
        mpvScripts.modernz
      ];
    })
    mprisence
  ];
}
