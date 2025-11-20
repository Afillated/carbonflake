{
  config,
  pkgs,
  inputs,
  ...
}:
{
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    polychromatic
    openrazer-daemon
    keyd
  ];
  users.users.carbon.extraGroups = [
    "openrazer"
    "keyd"
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            esc = "capslock";
            capslock = "esc";
            leftmeta = "leftalt";
            leftalt = "leftmeta";

          };
          otherlayer = { };
        };

      };
    };
  };
}
