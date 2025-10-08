{
  nix = {
    optimise.automatic = true;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://walker.cachix.org" ];
      trusted-public-keys = [ "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM=" ];
    };
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "24.05";
}
