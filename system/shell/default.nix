{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
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
    bsd-finger
  ];

  environment.sessionVariables = {
    EDITOR = "hx";
  };

  programs.bash.enable = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  hjem.users.carbon = {
    rum.programs = {
      git.settings = {
        user = {
          email = "1583904+Afillated@users.noreply.github.com";
          name = "Afillated";
        };
      };
    };
    files = {
      ".config/helix".source = ../../config/helix;
      ".config/fastfetch".source = ../../config/fastfetch;
    };

  };
}
