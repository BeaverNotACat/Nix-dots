{ username, ... }:
{
  home-manager.users.${username} = _: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "BeaverNotACat";
          email = "beavernotacat@gmail.com";
        };
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
