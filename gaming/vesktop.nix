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

  hjem.users.carbon.files = {
    ".config/vesktop/themes/HorizontalServerList.theme.css".source = ./vesktop-themes/HorizontalServerList.theme.css;
    ".config/vesktop/themes/midnight.theme.css".source = ./vesktop-themes/midnight.theme.css;
  };
}
