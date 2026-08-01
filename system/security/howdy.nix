{ pkgs, ... }: {
  services.howdy = {
    enable = true;
    control = "sufficient";
    settings = {
      video = {
        device_path = "/dev/video0";
      };
    };
  };
}
