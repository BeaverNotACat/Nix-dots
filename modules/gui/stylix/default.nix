{
  stylix,
  lib,
  pkgs,
  username,
  ...
}:
{
  fonts.fontconfig.defaultFonts = {
    serif = [ "Noto Serif" ];
    sansSerif = [ "Noto Sans" ];
    monospace = [
      "JetBrainsMono Nerd Font"
      "DejaVu Sans Mono"
    ];
    emoji = [ "Noto Color Emoji" ];
  };

  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      dejavu_fonts
      nerd-fonts.jetbrains-mono
    ];

    imports = [ stylix.homeModules.stylix ];
    stylix = {
      enable = true;
      polarity = "dark";

      targets.hyprpaper.enable = lib.mkForce false;

      image = ./wallpaper.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      cursor = {
        name = "Catppuccin-Mocha-Light-Cursors";
        package = pkgs.catppuccin-cursors.mochaLight;
        size = 12;
      };

      icons = {
        enable = true;
        package = pkgs.catppuccin-papirus-folders;
        dark = "Papirus-Dark";
      };

      fonts = {
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };

        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };

      };
      targets.zen-browser.profileNames = [ username ];
    };
  };
}
