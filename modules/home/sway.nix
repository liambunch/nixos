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

      # Monitor layout
      #
      # HDMI-A-1: portrait monitor on the left
      # DP-2:     landscape monitor in the center
      # DP-1:     landscape monitor on the right

      output."HDMI-A-1" = {
        mode = "1920x1080@60Hz";
        transform = "90";
        position = "0 0";
      };

      output."DP-1" = {
        mode = "1920x1080@60Hz";
        position = "1080 0";
      };

      output."DP-2" = {
        mode = "1920x1080@60Hz";
        position = "3000 0";
      };

      output."*".bg = "/mnt/unas/personal/Wallpapers/1936701.jpg fill";

      startup = [
        { command = "${pkgs.xrandr}/bin/xrandr --output DP-1 --primary"; always = true; }
      ];

      bars = [ ];

      # Assign workspaces to monitors
      workspaceOutputAssign = [
        { workspace = "1"; output = "HDMI-A-1"; }
        { workspace = "2"; output = "DP-1"; }
        { workspace = "3"; output = "DP-2"; }
      ];

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

  xdg.configFile."xdg-desktop-portal-wlr/config.toml".text = ''
    [screencast]
    chooser_type = "dmenu"
    chooser_cmd = "wofi --dmenu"
  '';
}