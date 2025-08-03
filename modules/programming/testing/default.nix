{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: { home.packages = with pkgs; [ k6 ]; };
}
