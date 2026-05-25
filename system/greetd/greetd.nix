{ pkgs, inputs, ... }:
{
  services.greetd = {
    enable = true;
    greeterManagesPlymouth = true;
  };
  programs.regreet = {
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
  };
  # environment.systemPackages = with pkgs; [
  #   # qtgreet
  #   wlgreet
  # ];

  # # services.greetd.settings = {
  #   default_session = {
  #     command = "Hyprland --config /etc/greetd/hyprland-greet.conf";
  #   };
  # };

}
