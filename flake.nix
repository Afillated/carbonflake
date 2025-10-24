{
  description = "carbonflake type shit";

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
      # # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # # THIS IS IMPORTANT
      # # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      # You may want hjem to use your defined nixpkgs input to
      # minimize redundancies.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      # You may want hjem-rum to use your defined nixpkgs input to
      # minimize redundancies.
      inputs.nixpkgs.follows = "nixpkgs";
      # Same goes for hjem, to avoid discrepancies between the version
      # you use directly and the one hjem-rum uses.
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
