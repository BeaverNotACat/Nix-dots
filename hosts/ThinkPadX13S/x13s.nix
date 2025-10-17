{ x13s, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s = {
        kernel = "jhovold";
        enable = true;
        bluetoothMac = "53:28:11:7B:07:A2";
        wifiMac = "00:03:7f:12:ed:93";
      };
      nixpkgs.config.allowUnfree = true;
    }
  ];
}
