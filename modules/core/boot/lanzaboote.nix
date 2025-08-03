{ pkgs, lib, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = lib.mkForce false;
  };
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
  environment.systemPackages = with pkgs; [
    sbctl
    efibootmgr
  ];
}
