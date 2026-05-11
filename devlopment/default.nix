{pkgs, inputs, ...}:
{
  imports = [
    ./language-servers.nix
    ./virtualisation.nix
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };
  
  hjem.users.carbon.rum.programs = {
    zed= {
      enable = true;
    };
  };
  
  environment.systemPackages = with pkgs; [
    heimdall
  ];
}
