{
  inputs,
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

    users.packet = {
      enable = true;
      directory = "/home/packet";
      user = "packet";
      rum.misc.gtk = {
        enable = true;
        settings = {
          theme-name = "Colloid-Dark";
        };
      };
    };
    # You should probably also enable clobberByDefault at least for now.
    clobberByDefault = true;
  };
}
