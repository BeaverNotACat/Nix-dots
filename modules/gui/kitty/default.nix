{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [ imagemagick ]; # icat
    programs.kitty = {
      enable = true;
      extraConfig = ''
        symbol_map U+2610-U+2612,U+2713-U+2718 DejaVu Sans Mono
      '';
    };
  };
}
