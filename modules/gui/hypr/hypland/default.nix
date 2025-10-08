{
  lib,
  pkgs,
  username,
  ...
}:
let
  exec_once_script = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.dunst}/bin/dunst &
    ${pkgs.walker}/bin/walker --gapplication-service
  '';
in
{
  programs.hyprland.enable = true;
  home-manager.users.${username} = _: {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        "$mainMod" = "SUPER";
        exec-once = "${exec_once_script}/bin/start";
        monitor = [
          "eDP-1,prefered,1920x0,1"
          "DP-2,prefered,0x0,1"
        ];
        input = {
          kb_layout = "us,ru";
          kb_options = "grp:toggle";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
          };
        };
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        binde = [
          ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
          ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
          ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ 'toggle'"
          ", XF86AudioMicMute, exec, pactl set-sink-mute @DEFAULT_SOURCE@ 'toggle'"
          ", xf86MonBrightnessUp, exec, brightnessctl s 5%+"
          ", xf86MonBrightnessDown, exec, brightnessctl s 5%-"
        ];
        bind = [
          "$mainMod, BACKSPACE, exit, "
          "$mainMod, SPACE, exec, walker"
          "$mainMod, ESCAPE, exec, hyprlock"
          "$mainMod, S, exec, kitty"
          "$mainMod, D, exec, zen"
          ", Print, exec, grim - | wl-copy --type=image/png"
          "$mainMod, Print, exec, slurp | grim -g - - | wl-copy --type=image/png"

          "$mainMod, R, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod, V, togglefloating,"
          "$mainMod, C, pin,"

          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"
        ]
        ++ (
          # workspaces: binds $mod + [shift +] {0..9} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              key:
              let
                workspace = if key != 0 then key else 10;
              in
              [
                "$mainMod, ${toString key}, workspace, ${toString workspace}"
                "$mainMod SHIFT, ${toString key}, movetoworkspace, ${toString workspace}"
              ]
            ) 10
          )
        );
        gesture = [
          "3, horizontal, workspace"
          "3, vertical, fullscreen"
          "4, down, close"
        ];
        animations = {
          enabled = "yes";
        };
        general = {
          gaps_in = 3;
          gaps_out = 3;
        };
        decoration = {
          rounding = 7;
        };
        misc = {
          disable_autoreload = true;
          force_default_wallpaper = 2;
          disable_hyprland_logo = lib.mkForce false;
        };
      };
    };
  };
}
