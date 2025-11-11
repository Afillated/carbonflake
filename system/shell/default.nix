{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./language-servers.nix
    ./starship.nix
    ./yazi.nix
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
    helix
    git
    tree
    jmtpfs
    yt-dlp
    btop
    fastfetch
    android-tools
  ];

  environment.sessionVariables = {
    EDITOR = "hx";
  };

  hjem.users.carbon.files = {
    ".config/helix".source = ../../config/helix;
    ".config/fastfetch".source = ../../config/fastfetch;

  };
}
