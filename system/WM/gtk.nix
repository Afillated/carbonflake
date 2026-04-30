{
  config,
  pkgs,
  inputs,
  ...
}:
{
  # gtk theme by vinceliuice
  # https://github.com/vinceliuice/Orchis-theme?tab=readme-ov-file
  hjem.users.carbon.files = {
    ".config/gtk-2.0".source = ../../config/gtk-2.0;
    ".config/gtk-3.0".source = ../../config/gtk-3.0;
    ".config/gtk-4.0".source = ../../config/gtk-4.0;
  };

  environment.systemPackages = with pkgs; [
    nwg-look
    gtk3
    gtk4
  ];

  environment.sessionVariables = {
    # Additional cursor/theme variables for better app support
    GTK_THEME = "Adwaita:dark"; # Helps with consistent theming
  };
}
