{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      slurp
      grim
      wl-clipboard
    ];
  };
}
