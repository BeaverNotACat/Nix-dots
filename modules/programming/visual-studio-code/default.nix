{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {

    nixpkgs.config.allowUnfree = true;

    programs.vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        # TODO
      ];
    };
  };
}
