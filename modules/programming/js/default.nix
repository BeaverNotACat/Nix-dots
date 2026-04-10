{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      nodejs
      bun

      # Editor tools
      typescript-language-server
      vscode-langservers-extracted
    ];
  };
}
