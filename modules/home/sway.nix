{ pkgs, lib, ... }:

let
  mod = "Mod4";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
in
{
  # Start Wayland services (waybar) with sway-session.target instead of
  # graphical-session.target. NixOS's session wrapper activates
  # graphical-session.target before sway exports WAYLAND_DISPLAY, so services
  # tied to it get skipped at login.
  wayland.systemd.target = "sway-session.target";

  wayland.windowManager.sway = {
    enable = true;
    package = null;

    config = {
      modifier = mod;
      terminal = "foot";
      menu = "wofi --show drun -I";

      bars = [ ];

      keybindings = lib.mkOptionDefault {
        # Lock screen
        "${mod}+Escape" = "exec swaylock -f -c 000000";

        # Screenshot a region to the clipboard
        "Print" = "exec grim -g \"$(slurp)\" - | wl-copy";

        # Volume keys
        "XF86AudioRaiseVolume" =
          "exec ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";

        "XF86AudioLowerVolume" =
          "exec ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-";

        "XF86AudioMute" =
          "exec ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
    };

    extraConfig = ''
      exec sh -c 'dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK XDG_SESSION_TYPE PATH && systemctl --user restart xdg-desktop-portal xdg-desktop-portal-wlr'
    '';
  };
}