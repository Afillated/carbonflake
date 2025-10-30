{
  config,
  inputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.vesktop
  ];

  hjem.users.carbon.files = {
    ".config/vesktop/themes".source = ../config/vesktop/themes;

  };

}
