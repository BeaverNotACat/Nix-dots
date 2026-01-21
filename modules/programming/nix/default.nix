{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      # Editor tools
      nil
      nixfmt
    ];
  };
}
