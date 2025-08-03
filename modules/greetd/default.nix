{ pkgs, username, ... }:
{
  services.greetd = {
    enable = true;
    settings = rec {
      beavernotacat_hyprland = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = username;
      };
      default_session = beavernotacat_hyprland;
    };
  };
}
