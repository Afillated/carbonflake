{ pkgs, inputs, ... }:
{
  services.greetd.enable = true;
  # programs.regreet.enable = true;
  environment.systemPackages = with pkgs; [
    qtgreet
    wlgreet
  ];

  services.greetd.settings = {
    default_session = {
      command = "Hyprland --config /etc/greetd/hyprland-greet.conf";
      # Replace 'wayfire' with your desired wlr-based Wayland compositor
    };
  };
}
