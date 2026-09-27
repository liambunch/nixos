{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Pairing GUI (blueman-manager) and the D-Bus service the tray applet needs.
  services.blueman.enable = true;
}
