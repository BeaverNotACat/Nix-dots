{ username, ... }:
{
  home-manager.users.${username} = _: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "BeaverNotACat";
      userEmail = "beavernotacat@gmail.com";
      extraConfig = {
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
