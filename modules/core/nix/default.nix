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
    };
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "24.05";
}
