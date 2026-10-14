{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    nh.url = "github:nix-community/nh";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hjem.follows = "hjem";
    };
    grub-themes = {
      url = "github:jeslie0/nixos-grub-themes";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      zen-browser,
      nh,
      ...
    }@inputs:
    {

      nixosConfigurations = {
        "carbon" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./carbon
            inputs.hjem.nixosModules.default
          ];
        };
      };
    };
}
