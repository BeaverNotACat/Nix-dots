{ pkgs, ... }:
{
  nix = {
    optimise.automatic = true;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://walker.cachix.org" ];
      trusted-public-keys = [ "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM=" ];
    };
  };

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
        libgcc
      ];
    };
    nh = {
      enable = true;
      clean.enable = true;
    };
  };

  system.stateVersion = "24.05";
}
