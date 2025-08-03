{ username, zen-browser, ... }:
{
  home-manager.users.${username} = _: {
    imports = [
      zen-browser.homeModules.beta
    ];
    programs.zen-browser.enable = true;
  };
}
