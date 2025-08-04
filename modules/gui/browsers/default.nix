{
  pkgs,
  username,
  zen-browser,
  ...
}:
{
  programs.firefox = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [ geckodriver ];

  nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
  home-manager.users.${username} = _: {
    home.packages = with pkgs; [
      (chromium.override { enableWideVine = true; })
    ];

    imports = [
      zen-browser.homeModules.beta
    ];
    programs.zen-browser.enable = true;

  };
}
