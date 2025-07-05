{ ... }:

{
  home.username = "lono";
  home.homeDirectory = "/home/lono";

  imports = [
    ../../hmModules
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
