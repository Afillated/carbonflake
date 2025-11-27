{config, pkgs, inputs, ...}: {
  # gtk theme by vinceliuice
  # https://github.com/vinceliuice/Orchis-theme?tab=readme-ov-file
  hjem.users.carbon.files = {
    ".config/gtk-2.0".source = ../../config/gtk-2.0;
    ".config/gtk-3.0".source = ../../config/gtk-3.0;
    ".config/gtk-4.0".source = ../../config/gtk-4.0;
  };
}
