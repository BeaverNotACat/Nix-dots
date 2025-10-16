{ x13s, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s = {
        kernel = "mainline";
        enable = true;
        bluetoothMac = "f3:f0:05:05:37:00"; # FEFOO SOSET
        wifiMac = "f3:f0:05:05:37:00"; # FEFOO SOSET
      };
      nixpkgs.config.allowUnfree = true;
    }
  ];
}
