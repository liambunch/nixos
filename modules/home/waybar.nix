{ pkgs, ... }:

let
  wpctl = "${pkgs.wireplumber}/bin/wpctl";

  # Glyphs from Symbols Nerd Font, by codepoint (Nerd Font name in comments).
  icon = code: builtins.fromJSON ''"\u${code}"'';
  icons = {
    volumeOff = icon "f026"; # fa-volume_off
    volumeLow = icon "f027"; # fa-volume_low
    volumeUp = icon "f028"; # fa-volume_up
    muted = icon "eee8"; # fa-volume_xmark
    headphones = icon "f025"; # fa-headphones
    tv = icon "f26c"; # fa-tv
    ethernet = icon "ef44"; # fa-ethernet
    wifi = icon "f1eb"; # fa-wifi
    disconnected = icon "f127"; # fa-unlink
    cpu = icon "f2db"; # fa-microchip
    memory = icon "efc5"; # fa-memory
    clock = icon "f017"; # fa-clock_o
  };

  # Pick the default output (sink) or input (source) from a wofi menu.
  audio-switch = pkgs.writeShellApplication {
    name = "audio-switch";
    runtimeInputs = with pkgs; [ pipewire wireplumber jq wofi ];
    text = ''
      case "''${1:-sink}" in
        sink) class="Audio/Sink" prompt="Output" ;;
        source) class="Audio/Source" prompt="Input" ;;
        *) echo "usage: audio-switch [sink|source]" >&2; exit 1 ;;
      esac

      nodes=$(pw-dump | jq -c --arg class "$class" '
        [.[] | select(.type == "PipeWire:Interface:Node"
                      and .info.props."media.class" == $class)
             | {id, desc: (.info.props."node.description" // .info.props."node.name")}]')

      choice=$(jq -r '.[].desc' <<<"$nodes" | wofi --dmenu --prompt "$prompt") || exit 0

      id=$(jq -r --arg desc "$choice" \
        'first(.[] | select(.desc == $desc) | .id) // empty' <<<"$nodes")
      if [ -n "$id" ]; then
        wpctl set-default "$id"
      fi
    '';
  };
in
{
  home.packages = [ pkgs.nerd-fonts.symbols-only ];

  programs.waybar = {
    enable = true;
    systemd.enable = true; # starts with Sway and restarts on rebuild

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 28;
      spacing = 4;

      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "pulseaudio" "network" "cpu" "memory" "clock" "tray" ];

      "sway/window" = {
        max-length = 60;
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "${icons.muted} muted";
        # Matched against the active port name, so the icon shows which
        # output is in use.
        format-icons = {
          headphone = icons.headphones;
          hdmi = icons.tv;
          default = [ icons.volumeOff icons.volumeLow icons.volumeUp ];
        };
        tooltip-format = "{desc}";
        on-click = "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = "${audio-switch}/bin/audio-switch sink";
        on-click-middle = "${audio-switch}/bin/audio-switch source";
      };

      network = {
        format-ethernet = "${icons.ethernet} {ipaddr}";
        format-wifi = "${icons.wifi} {essid}";
        format-disconnected = "${icons.disconnected} down";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
      };

      cpu = {
        format = "${icons.cpu} {usage}%";
      };

      memory = {
        format = "${icons.memory} {percentage}%";
      };

      clock = {
        format = "${icons.clock} {:%a %d %b  %H:%M}";
        tooltip-format = "<tt>{calendar}</tt>";
      };

      tray = {
        icon-size = 16;
        spacing = 8;
      };
    };

    style = ''
      * {
        font-family: sans-serif, "Symbols Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: #1e1e1e;
        color: #dddddd;
      }

      #workspaces button {
        padding: 0 8px;
        color: #aaaaaa;
        background: transparent;
      }

      #workspaces button.focused {
        background: #285577;
        color: #ffffff;
      }

      #workspaces button.urgent {
        background: #900000;
        color: #ffffff;
      }

      #mode {
        background: #900000;
        padding: 0 8px;
      }

      #pulseaudio, #network, #cpu, #memory, #clock, #tray {
        padding: 0 8px;
      }
    '';
  };
}