{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../shell/starship.nix
    ../shell/yazi.nix
    ../shell/nh.nix
  ];

  environment.systemPackages = with pkgs; [
    helix
    git
    nil
    tree
    dualsensectl
        jmtpfs  ];
}
