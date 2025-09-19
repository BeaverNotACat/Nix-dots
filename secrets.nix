let
  keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFbmEd+3bjAPVHZSvA1yLdexdQnSni+Vf9znQ2177G7b beavernotacat@nixos"
  ];
in
{
  "modules/hardware/network/secrets.age".publicKeys = keys;
  "modules/proxies/xray/config.json.age".publicKeys = keys;

}
