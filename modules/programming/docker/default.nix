{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      registry-mirrors = [
        "https://mirror.gcr.io"
        "https://cr.yandex/mirror"
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];
}
