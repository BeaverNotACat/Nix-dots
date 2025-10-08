{ stable-nixpkgs, lib, ... }:
{
  # Bluez 5.83 has critical bug with qualcomm adapter
  # https://github.com/bluez/bluez/issues/1394
  hardware.bluetooth.package = lib.mkForce stable-nixpkgs.legacyPackages.aarch64-linux.bluez;
}
