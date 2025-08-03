{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [ libnotify ];
    services.dunst = {
      enable = true;
      settings.global = {
        rounded = "yes";
        corner_radius = 5;
        frame_width = 1;
      };
    };
  };
}
