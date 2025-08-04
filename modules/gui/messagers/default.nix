{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      telegram-desktop
      matrix-desktop
    ];
  };
}
