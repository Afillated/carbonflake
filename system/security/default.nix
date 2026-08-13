{pkgs, ...}: {
  imports = [
    ./greetd.nix
    # ./howdy.nix
  ];

  environment.systemPackages = with pkgs; [
    seahorse    
  ];
  services.gnome.gnome-keyring.enable = true;
}
