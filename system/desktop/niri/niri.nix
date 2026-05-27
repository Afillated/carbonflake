{ pkgs, lib, ... }:
{

  programs.niri = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
  hjem.users.carbon.rum.desktops.niri = {
    enable = true;
    config = (
      lib.concatMapStringsSep "\n" builtins.readFile [
        ./config.kdl
        ./binds.kdl
        ./winrules.kdl
      ]
    );
  };
}
