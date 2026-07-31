{ pkgs, inputs, ... }:
let
  nh-pkg = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  programs.nh = {
    enable = true;
    flake = "/home/carbon/carbonflake";
    package = nh-pkg;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 8";
    };
  };
}
