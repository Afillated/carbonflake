{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    nh.url = "github:nix-community/nh";
     spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };
  };

  outputs = { self, nixpkgs, zen-browser,nh , ... }@inputs:   {

    nixosConfigurations = {
      "carbon" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./carbon
          inputs.spicetify-nix.nixosModules.default
        ];
      };
    };

  };
}
