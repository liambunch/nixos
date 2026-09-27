{ config, ... }:

{
  # Tray icon in waybar for connecting devices. Tied to the same target as
  # waybar, since graphical-session.target is skipped at login (see sway.nix).
  services.blueman-applet = {
    enable = true;
    systemdTargets = [ config.wayland.systemd.target ];
  };
}
