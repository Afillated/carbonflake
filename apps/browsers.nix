{pkgs, inputs, ...}:
let
 zen-twilight = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight;
in
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    zen-twilight
  ];
}
