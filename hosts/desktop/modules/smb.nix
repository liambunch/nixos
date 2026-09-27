{ ... }:

{
  systemd.tmpfiles.rules = [
    "d /secrets     0700 root root -"
    "z /secrets/smb 0600 root root -"
  ];
  
  fileSystems."/mnt/unas/personal" = {
    device = "//192.168.1.4/Personal-Drive";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"

      "credentials=/secrets/smb"

      "uid=1000"
      "gid=100"
    ];
  };

  fileSystems."/mnt/unas/media" = {
    device = "//192.168.1.4/Media";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"

      "credentials=/secrets/smb"

      "uid=1000"
      "gid=100"
    ];
  };
}