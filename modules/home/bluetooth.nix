{ config, ... }:

{
  services.blueman-applet = {
    enable = true;
    systemdTargets = [ config.wayland.systemd.target ];
  };
}
