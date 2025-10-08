{ config, ... }:
{
  age.secrets.secrets = {
    file = ./secrets.age;
  };

  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;

      allowAuxiliaryImperativeNetworks = true;
      secretsFile = config.age.secrets.secrets.path;

      networks = {
        "Beavers hotspot".pskRaw = "ext:BeaversHotspotPSK";
        "BeaversWiFi".pskRaw = "ext:BeaversWiFiPSK";
        "Nyaspot".pskRaw = "ext:NyatspotPSK";
        "DVFU-STUDENTS".auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          scan_ssid=1
          phase1="peaplabel=0"
          phase2="auth=MSCHAPV2"
          identity="gubanov.ima"
          password=ext:DvfuStudentsPSK
        '';
      };
    };
  };
}
