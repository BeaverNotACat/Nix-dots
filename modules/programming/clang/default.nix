{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      gcc
      gdb
      gnumake

      # Editor tools
      clang-tools
    ];
  };
}
