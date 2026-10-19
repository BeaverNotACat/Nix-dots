{ username, ... }:
{
  home-manager.users.${username} = _: {
    programs.mpv.enable = true;
  };
}
