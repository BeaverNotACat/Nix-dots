{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      python314
      uv

      # Editor tools
      pyright
      ruff
    ];
  };
}
