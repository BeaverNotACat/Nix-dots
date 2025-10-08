{
  pkgs,
  username,
  ...
}:
{
  users.users.${username} = {
    extraGroups = [ "audio" ];
  };

  security.rtkit.enable = true;
  environment.systemPackages = with pkgs; [ pulseaudio ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
  };
}
