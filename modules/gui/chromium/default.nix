{ pkgs, username, ... }:
{
  nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      (chromium.override { enableWideVine = true; })
    ];
  };
}
