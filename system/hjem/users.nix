{ pkgs, ... }: {

  users.users.carbon = {
    isNormalUser = true;
    description = "Afillatedcarbon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
    packages = with pkgs; [ ];
  };

}
