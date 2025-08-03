{ hostName, ... }:
{
  imports = [
    ./${hostName}
    ./i18n
  ];
}
