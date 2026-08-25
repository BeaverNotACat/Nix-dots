{ x13s, pkgs, ... }:
{
  imports = [
    x13s.nixosModules.default
    {
      nixos-x13s = {
        kernel = pkgs.linux; # linux_latest causes bootloop
        enable = true;
        bluetoothMac = "F4:A8:0D:30:9F:97";
        wifiMac = "06:A8:0D:F5:5B:64";
      };
      nixpkgs.config.allowUnfree = true;
    }
  ];

  # TPM2 Is unsupported and slows startup
  systemd.tpm2.enable = false;
  boot.initrd.systemd.tpm2.enable = false;
}
