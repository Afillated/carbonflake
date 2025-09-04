{
  inputs,
  config,
  pkgs,
  ...
}:
{
  # configuration.nix
  hjem = {
    # Importing the modules
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    # Configuring your user(s)
    users.carbon = {
      enable = true;
      directory = "/home/carbon";
      user = "carbon";
    };
    # You should probably also enable clobberByDefault at least for now.
    clobberByDefault = true;
  };
}
