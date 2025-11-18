{
  config,
  inputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vesktop
  ];

  hjem.users.carbon.files = {
    ".config/vesktop/themes".source = ../config/vesktop/themes;

  };

}
