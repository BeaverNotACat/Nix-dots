{ x13s, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s = {
        kernel = "mainline";
        enable = true;
        bluetoothMac = "00:03:7f:12:ed:93";
        wifiMac = "00:03:7f:12:ed:93";
      };
      nixpkgs.config.allowUnfree = true;
    }
  ];
}
