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
      # withOpenASAR = true; # can do this here too
      withVencord = true;
    })
    element-desktop
  ];

  hjem.users.carbon.files = {
    ".config/vesktop/themes/HorizontalServerList.theme.css".source = ../config/vesktop/themes/HorizontalServerList.theme.css;
    ".config/vesktop/themes/midnight.theme.css".source = ../config/vesktop/themes/midnight.theme.css;
  };

}
