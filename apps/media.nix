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
    davinci-resolve
    ffmpeg
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
  ];

  hjem.users.carbon = {
    enable = true;

    xdg.config.files."mpv/mpv.conf".text = ''
      hwdec=auto-safe
    '';

    xdg.data.files."applications/davinci-resolve.desktop" = {
      source = "${
        pkgs.makeDesktopItem {
          name = "davinci-resolve";
          desktopName = "DaVinci Resolve";
          genericName = "Video Editor";
          exec = "env QT_QPA_PLATFORM=xcb nvidia-offload davinci-resolve %u";
          icon = "davinci-resolve";
          terminal = false;
          categories = [
            "AudioVideo"
            "Video"
          ];
        }
      }/share/applications/davinci-resolve.desktop";
      clobber = true;
    };
  };
}
