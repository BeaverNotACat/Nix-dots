{ username, ... }:
{
  home-manager.users.${username} = _: {
    home = {
      username = "${username}";
      homeDirectory = "/home/${username}";
      stateVersion = "24.05";
    };
  };
}
