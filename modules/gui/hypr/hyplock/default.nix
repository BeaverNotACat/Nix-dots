{ username, home-manager, ... }:
{
  home-manager.users.${username} = _: {
    programs.hyprlock.enable = true;
  };
}
