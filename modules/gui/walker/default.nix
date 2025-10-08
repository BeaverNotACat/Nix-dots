{ username, walker, ... }:
{
  home-manager.users.${username} = _: {
    imports = [ walker.homeManagerModules.default ];

    programs.walker = {
      enable = true;
      runAsService = true;

      config = {
        theme_base = [ "catppuccin" ];

        activation_mode.disabled = true;
        ignore_mouse = true;
      };
    };
  };
}
