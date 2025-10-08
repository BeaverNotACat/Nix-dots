{ x13s, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s = {
        kernel = "mainline";
        enable = true;
        bluetoothMac = "6c:1f:f7:00:30:e2";
        wifiMac = "6c:1f:f7:00:30:e2";
      };
      nixpkgs.config.allowUnfree = true;
    }
  ];
}
