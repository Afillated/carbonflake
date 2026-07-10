{
  config,
  inputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vesktop
    (discord.override {
      withVencord = true;
    })
    element-desktop
  ];

  hjem.users.carbon = {
    packages = with pkgs; [
      mprisence
    ];
    systemd.services.mprisence = {
      description = "Mprisence Discord Rich Presence for MPRIS";
      wantedBy = [ "default.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.mprisence}/bin/mprisence";
        Restart = "on-failure";
      };
    };
    files = {
      ".config/vesktop/themes/HorizontalServerList.theme.css".source =
        ./vesktop-themes/HorizontalServerList.theme.css;
      ".config/vesktop/themes/midnight.theme.css".source = ./vesktop-themes/midnight.theme.css;
    };
  };
}
