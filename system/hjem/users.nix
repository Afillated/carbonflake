{config, pkgs, inputs, ...}: {
  users.users.packet = {
    isNormalUser = true;
    description = "Gamerpacket";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
    packages = with pkgs; [ ];
  };
	
}
