{ username, ... }:
{
  home-manager.users.${username} = _: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "BeaverNotACat"; # TODO: make cutomisable
          email = "beavernotacat@gmail.com"; # TODO
        };
        config = {
          core.editor = "hx";
        };
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
