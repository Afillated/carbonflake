{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
    prismlauncher
    winetricks
    mcpelauncher-ui-qt
    heroic
  ];
}
