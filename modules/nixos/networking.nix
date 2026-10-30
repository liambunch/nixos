{ ... }:

{
  networking.networkmanager.enable = true;

  systemd.tmpfiles.rules = [
    "z /secrets/wifi 0600 root root -"
  ];

  networking.networkmanager.ensureProfiles = {
    # Contains LN1_PSK=<password>
    environmentFiles = [ "/secrets/wifi" ];

    profiles.LN1 = {
      connection = {
        id = "LN1";
        type = "wifi";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "LN1";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "$LN1_PSK";
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
    };
  };
}
