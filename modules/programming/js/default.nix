{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      nodejs
      deno

      # Editor tools
      typescript-language-server
      vscode-langservers-extracted
    ];
  };
}
