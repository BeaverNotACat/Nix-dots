{
  description = "BeaverNotACat's config for ";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    stable-nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      # inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    x13s = {
      url = "github:BrainWart/x13s-nixos";
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

    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
