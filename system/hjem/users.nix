{ pkgs, ... }: {

  users.users.carbon = {
    isNormalUser = true;
    description = "Afillatedcarbon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
      "power"
    ];
    packages = with pkgs; [ ];
  };

}
