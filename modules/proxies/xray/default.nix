{
  pkgs,
  config,
  username,
  ...
}:
{
  age.secrets.config = {
    file = ./config.json.age;
    path = "/run/agenix/config.json";
    owner = username;
  };

  home-manager.users.${username} = _: {
    systemd.user.services.xray-proxy = {
      Unit = {
        Description = "Local Xray proxy";
        After = "network.target";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${pkgs.xray}/bin/xray -c ${config.age.secrets.config.path} run";
        ExecStop = "${pkgs.toybox}/bin/killall xray";
      };
    };
  };
}
