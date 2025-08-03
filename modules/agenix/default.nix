{ agenix, system, ... }:
{
  imports = [ agenix.nixosModules.default ];
  environment.systemPackages = [ agenix.packages.${system}.default ];
  age.identityPaths = [ "/var/lib/persistent/agenix" ];
}
