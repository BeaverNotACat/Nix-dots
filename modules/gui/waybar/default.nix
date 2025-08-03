{ lib, username, ... }:
{
  home-manager.users.${username} = _: {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";

          modules-center = [ "clock" ];
          modules-left = [ "network" ];
          modules-right = [
            "pulseaudio"
            "backlight"
            "memory"
            "cpu"
            "battery"
          ];

          "battery" = {
            "format" = "{icon}  {capacity}%";
            "format-icons" = [
              ""
              ""
              ""
              ""
              ""
            ];
            "states" = {
              "critical" = 15;
              "good" = 95;
              "warning" = 30;
            };
          };

          "backlight" = {
            "format" = "{icon}  {percent}%";
            "format-icons" = [
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
          };

          "clock" = {
            "format" = "{:%d %a %H:%M}";
            "interval" = 1;
            "tooltip" = true;
            "tooltip-format" = "{calendar}";
          };

          "cpu" = {
            "format" = "󰍛 {usage}%";
            "interval" = 1;
            "on-click" = "kitty -e btop";
          };

          "memory" = {
            "format" = "󰻠 {percentage}%";
            "interval" = 1;
            "states" = {
              "warning" = 85;
            };
            "on-click" = "kitty -e btop";
          };

          "network" = {
            "format-disconnected" = "󰯡  Disconnected";
            "format-ethernet" = "󰒢  Connected!";
            "format-linked" = "󰖪  {essid} (No IP)";
            "format-wifi" = "󰖩  {essid}";
            "interval" = 1;
            "tooltip" = false;
          };

          "pulseaudio" = {
            "format" = "{icon}  {volume}%";
            "format-icons" = {
              "default" = [
                ""
                ""
                ""
              ];
            };
            "format-muted" = "󰖁 Muted";
            "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "scroll-step" = 1;
            "tooltip" = true;
          };
        };
      };
      style = lib.mkAfter ''
        *{
          font-size: 12pt;
          font-weight: 500;
          margin: 2px;
          transition-duration: 0.5s;
          padding-left: 5px;
          padding-right: 5px;
        }

        @keyframes blink_red {
          to {
            color: @base04;
          }
        }
        .warning, .critical, .urgent {
          animation-name: blink_red;
          animation-duration: 1s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }
      '';
    };
  };
}
