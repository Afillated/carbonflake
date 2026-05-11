{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vlc
    sly
    kdePackages.kdenlive
    krita
    (mpv.override {
      scripts = [
        mpvScripts.mpv-discord
        mpvScripts.mpv-playlistmanager
        mpvScripts.memo
        mpvScripts.mpris
        mpvScripts.modernz
      ];
    })
  ];
}
