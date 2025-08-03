{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      nodejs
      bun

      # Editor tools
      nodePackages.typescript-language-server
    ];
  };
}
