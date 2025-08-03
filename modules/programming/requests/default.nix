{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    nixpkgs.config.allowUnsupportedSystem = true;

    home.packages = with pkgs; [
      curl
    ];
  };
}
