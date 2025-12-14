{ x13s, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s = {
        kernel = "mainline";
        enable = true;
        bluetoothMac = "53:28:11:7B:07:A2";
        wifiMac = "00:03:7f:12:ed:93";
      };
      nixpkgs.config.allowUnfree = true;
    }
  ];

  # SLows pc startup and currently not supported
  systemd.tpm2.enable = false;
  boot.initrd.systemd.tpm2.enable = false;
}
