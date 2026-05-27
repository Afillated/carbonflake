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
    # yt-dlp
    btop
    fastfetch
    android-tools
    bsd-finger
    libqalculate
    scooter
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
      ".config/fastfetch/config.jsonc".text = ''
        {
            "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
            "logo": {
                "padding": {
                    "top": 2
                }
            },
            "display": {
                "separator": " 󱞩 ",
                "constants": [
                    "──────────────────────────────"
                ]
            },
            "modules": [
                {
                    "type": "custom",
                    "format": "┌{$1}{$1}┐",
                    "outputColor": "red"
                },
                {
                    "type": "title",
                    "keyWidth": 10
                },
                {
                    "type": "custom",
                    "format": "└{$1}{$1}┘",
                    "outputColor": "red"
                },
                {
                    "type": "custom",
                    // "format": " {#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39}       {#38}  {#37}  {#36}  {#35}  {#34}  {#33}  {#32}  {#31}  {#90}"
                },
                {
                    "type": "custom",
                    "format": "┌{$1}{$1}┐",
                    "outputColor": "red"
                },
                {
                    "type": "os",
                    "key": "{icon} OS",
                    "keyColor": "red"
                },
                {
                    "type": "kernel",
                    "key": "│ ├",
                    "keyColor": "red"
                },
                {
                    "type": "packages",
                    "key": "│ ├󰏖",
                    "keyColor": "red"
                },
                {
                    "type": "shell",
                    "key": "│ └",
                    "keyColor": "red"
                },
                {
                    "type": "wm",
                    "key": " WM",
                    "keyColor": "red"
                },
                {
                    "type": "wmtheme",
                    "key": "│ ├󰉼",
                    "keyColor": "red"
                },
                {
                    "type": "host",
                    "key": "󰌢 PC",
                    "keyColor": "red"
                },
                {
                    "type": "cpu",
                    "key": "│ ├󰻠",
                    "keyColor": "red"
                },
                {
                    "type": "gpu",
                    "key": "│ ├󰍛",
                    "keyColor": "red"
                },
                {
                    "type": "disk",
                    "key": "│ ├",
                    "keyColor": "red"
                },
                {
                    "type": "memory",
                    "key": "│ ├󰑭",
                    "keyColor": "red"
                },
          
                {
                    "type": "uptime",
                    "key": "│ └󰅐",
                    "keyColor": "red"
                },
                {
                    "type": "custom",
                    "format": "└{$1}{$1}┘",
                    "outputColor": "red"
                },
                "break"
            ]
        }
      '';
    };

  };
}
