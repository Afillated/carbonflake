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
    jmtpfs
    yt-dlp
    jdt-language-server
    btop
  ];

  environment.sessionVariables = {
    EDITOR = "hx";
  };

  hjem.users.carbon.files = {
    ".config/helix".source = ../../config/helix;
    ".config/kitty".source = ../../config/kitty;
  };
}
