{ pkgs, inputs, ... }:
{
  services.greetd = {
    enable = true;
    greeterManagesPlymouth = true;
  };

  services.greetd.settings = {
    default_session = {
      command = "start-hyprland -- --config /etc/greetd/hypr/hyprland-greet.lua &> /dev/null";
    };
  };

  environment.etc."greetd/hypr/hyprland-greet.lua".source = ./hypr/hyprland-greet.lua;
  environment.etc."greetd/hypr/wallpaper.jpg".source = ./hypr/wallpaper.jpg;
  environment.etc."greetd/quickshell".source = ./greeter;
}
