{ config, pkgs, ... }:

{
  home.username = "lono";
  home.homeDirectory = "/home/lono";

  imports = [
    ../../hmModules/packages
    ../../hmModules/neovim
    ../../hmModules/git
    ../../hmModules/starship
    ../../hmModules/fish
    ../../hmModules/swappy
    ../../hmModules/scripts
    ../../hmModules/hyprland
    ../../hmModules/wezterm
    ../../hmModules/ruff
    ../../hmModules/wlogout
    ../../hmModules/librewolf
    ../../hmModules/swaylock
    ../../hmModules/direnv
    ../../hmModules/ghostty
    ../../hmModules/udiskie
    ../../hmModules/smayimg
    ../../hmModules/mimeApps
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
