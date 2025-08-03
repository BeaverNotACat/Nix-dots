{ username, walker, ... }:
{
  home-manager.users.${username} = _: {
    imports = [ walker.homeManagerModules.default ];

    programs.walker = {
      enable = true;
      runAsService = true;

      config = {
        theme_base = [ "catppuccin" ];

        activation_mode.disabled = true;
        ignore_mouse = true;
      };

      theme = {
        layout = {
          ui = {
            # anchors.top = true;
            window = {
              h_align = "fill";
              v_align = "fill";
              box = {
                height = "200";
                h_align = "center";
              };
            };
          };
        };
        style = ''
          @define-color foreground rgb(205, 214, 244);
          @define-color background rgb(30, 30, 46);
          @define-color color1 rgb(249, 226, 175);
          * {
            border-radius: 5;
          }
        '';
      };
    };
  };
}
