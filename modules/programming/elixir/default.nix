{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      beamPackages.elixir
      elixir-ls
    ];
  };
}
