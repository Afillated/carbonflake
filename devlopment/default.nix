{pkgs, inputs, ...}:
{
  imports = [
    ./language-servers.nix
    ./virtualisation.nix
  ];

  hjem.users.carbon.rum.programs = {
    zed= {
      enable = true;
      settings = {
        theme = "Ashen";
        helix_mode = true;
      };
    };
  };
  
}
