{ pkgs, username, ... }:
{
  users.users.${username} = {
    extraGroups = [ "kvm" ];
  };

  environment.systemPackages = with pkgs; [ libcamera ];
}
