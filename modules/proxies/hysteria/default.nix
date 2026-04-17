{
  pkgs,
  config,
  username,
  ...
}:
{
  age.secrets.config = {
    file = ./config.yaml.age;
    path = "/etc/hysteria-config.yaml";
    owner = username;
  };

  home-manager.users.${username} = _: {
    systemd.user.services.hysteria = {
      Unit = {
        Description = "Local Hysteria proxy";
        After = "network.target";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${pkgs.hysteria}/bin/hysteria -c ${config.age.secrets.config.path}";
        ExecStop = "${pkgs.toybox}/bin/killall hysteria";
      };
    };
  };
}
