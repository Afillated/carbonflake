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
  ];

  hjem.users.carbon.files = {
    ".config/vesktop/themes".source = ../config/vesktop/themes;

  };

}
