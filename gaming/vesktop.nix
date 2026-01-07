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
    ".config/vesktop/themes".source = ../config/vesktop/themes;
    ".config/vencord/themes".source = ../config/vesktop/themes;

  };

}
