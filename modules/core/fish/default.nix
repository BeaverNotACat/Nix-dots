{ username, ... }:
{
  home-manager.users.${username} = _: {
    programs = {
      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting # Disable greeting
        '';
      };
    };
  };
}
