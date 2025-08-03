{
  pkgs,
  config,
  username,
  ...
}:
{
  age.secrets.config = {
    file = ./shadowsocks.json.age;
    owner = username;
  };

  home-manager.users.${username} = _: {
    systemd.user.services.shadowsocks-proxy = {
      Unit = {
        Description = "Local Shadowsocks proxy";
        After = "network.target";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${pkgs.shadowsocks-rust}/bin/sslocal -c ${config.age.secrets.config.path}";
        ExecStop = "${pkgs.toybox}/bin/killall sslocal";
      };
    };
  };
}
