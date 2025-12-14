{
  description = "BeaverNotACat's config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    x13s = {
      url = "github:BeaverNotACat/x13s-nixos/update-inputs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker.url = "github:abenz1267/walker";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {

        ThinkpadX13s =
          let
            system = "aarch64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "beavernotacat";
              hostName = "ThinkPadX13S";
              type = "laptop";
              inherit system;
            }
            // inputs;
            modules = [ ./. ];
          };
      }; # nixosConfigurations end
    };
}
