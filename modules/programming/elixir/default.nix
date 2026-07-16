{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      elixir
      elixir-ls
    ];
  };
}
