{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      python314
      poetry
      uv

      # Editor tools
      basedpyright
      ruff
    ];
  };
}
