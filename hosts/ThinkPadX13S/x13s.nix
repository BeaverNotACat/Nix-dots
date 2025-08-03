{ x13s, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s.enable = true;
      nixpkgs.config.allowUnfree = true;
      nixos-x13s.kernel = "mainline";
      # bluetoothMac = "F4-A8-0D-F5-5B-64";
      # wifiMac = "F4-A8-0D-F5-5B-64";
    }
  ];
}
