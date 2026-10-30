{ pkgs, ... }:

{
  wayland.windowManager.sway.config = {
    # Monitor layout
    #
    # HDMI-A-1: portrait monitor on the left
    # DP-1:     landscape monitor in the center
    # DP-2:     landscape monitor on the right

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

    # Make DP-1 primary for X11 apps, so games don't open on the portrait monitor
    startup = [
      { command = "${pkgs.xrandr}/bin/xrandr --output DP-1 --primary"; always = true; }
    ];

    # Assign workspaces to monitors
    workspaceOutputAssign = [
      { workspace = "1"; output = "HDMI-A-1"; }
      { workspace = "2"; output = "DP-1"; }
      { workspace = "3"; output = "DP-2"; }
    ];
  };
}
