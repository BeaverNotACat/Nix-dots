{ ... }:
{
  users.users.beavernotacat = {
    isNormalUser = true;
    description = "BeaverNotACat";
    extraGroups = [
      "wheel"
      "docker"
      "dialout"
      "audio"
      "video"
      "kvm"
      "tss"
    ];
  };
}
