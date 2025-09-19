{ config, ... }:
{
  age.secrets.secrets = {
    file = ./secrets.age;
  };

  networking = {
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    wireless = {
      enable = true;
      userControlled.enable = true;

      allowAuxiliaryImperativeNetworks = true;
      secretsFile = config.age.secrets.secrets.path;

      networks = {
        "Beavers hotspot".pskRaw = "ext:BeaversHotspotPSK";
        "BeaversWiFi".pskRaw = "ext:BeaversWiFiPSK";
        "Nyaspot".pskRaw = "ext:NyatspotPSK";
        "YOTA-0F0B".psk = "L707L7EAG9T";
        "Wive-NG-MT".psk = "bav503100";
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
