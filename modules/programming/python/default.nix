{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      python314
      uv
      rye
      poetry

      # Editor tools
      pyright
      ruff
    ];
  };
}
