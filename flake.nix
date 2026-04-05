{
  description = "A flake for all my systems, I want consistency and stability hence carbonflake(yeah I just made this shit up lol)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    nh.url = "github:nix-community/nh";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };
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
   hyprlauncher = {
      url = "github:hyprwm/hyprlauncher";
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
            inputs.spicetify-nix.nixosModules.default
            inputs.hjem.nixosModules.default
          ];
        };
      };
    };
}
