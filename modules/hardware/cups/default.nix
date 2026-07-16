{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
      pkgs.hplipWithPlugin
    ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
