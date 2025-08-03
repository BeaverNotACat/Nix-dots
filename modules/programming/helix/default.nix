{ username, ... }:
{
  home-manager.users.${username} = _: {
    programs.helix = {
      enable = true;
      settings = {
        editor = {
          auto-save = true;
          auto-format = true;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          file-picker = {
            hidden = false;
            git-ignore = false;
          };
          statusline = {
            left = [
              "mode"
              "read-only-indicator"
              "spinner"
            ];
            center = [ "file-name" ];
            right = [
              "diagnostics"
              "selections"
              "position"
              "file-line-ending"
            ];
          };
        };
      };
      languages = {
        language = [
          {
            name = "python";
            auto-format = true;
            language-servers = [
              "pyright"
              "ruff"
            ];
            formatter.command = "ruff format";
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = "nixfmt";
          }
        ];
      };
    };
  };
}
