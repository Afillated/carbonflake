{ pkgs, inputs, ... }:
{
  services.greetd = {
    enable = true;
    greeterManagesPlymouth = true;
  };
  # programs.regreet = {
  #   enable = true;
  #   theme = {
  #     name = "Colloid-Dark";
  #     package = pkgs.colloid-gtk-theme;
  #   };
  # };

  services.greetd.settings = {
    default_session = {
      command = "start-hyprland -- --config /etc/greetd/hypr/hyprland-greet.lua";
    };
  };

  environment.etc."greetd/hypr/hyprland-greet.lua".source = ./hypr/hyprland-greet.lua;
  environment.etc."greetd/hypr/greetpaper.conf".text = ''
    splash = false
    wallpaper {
    	monitor =
    	path = /etc/greetd/hypr/wallpaper.png
    	fit_mode = file
    } 
  '';
  environment.etc."greetd/hypr/wallpaper.png".source = ../desktop/hyprland/wallpapers/wallpaper.png;
  environment.etc."greetd/quickshell".source = ./greeter;
}
