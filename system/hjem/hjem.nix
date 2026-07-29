{
  inputs,
  pkgs,
  ...
}:
{
  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    users.carbon = {
      enable = true;
      directory = "/home/carbon";
      user = "carbon";
      rum = {
        # environment.hideWarning = true;
      };
    };
    clobberByDefault = true;
  };
}
