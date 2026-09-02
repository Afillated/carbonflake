{ pkgs, inputs, ... }:
{
  imports = [
    ./language-servers.nix
    # ./virtualisation.nix
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  environment.systemPackages = with pkgs; [
    heimdall
  ];
}
