{ pkgs, inputs, ... }:
let
  mint = inputs.mint-manager.packages.${pkgs.system}.default;
in
{

  environment.systemPackages = with pkgs; [
    r2modman
    satisfactorymodmanager
    mint

  ];
}
