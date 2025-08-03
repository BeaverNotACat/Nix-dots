{ pkgs, ... }:
{
  users.users.beavernotacat = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "BeaverNotACat";
    extraGroups = [
      "wheel"
      "docker"
      "audio"
      "video"
      "kvm"
    ];
  };
}
