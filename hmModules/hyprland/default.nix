{ config, ... }:

{
  home.file.".config/hypr/" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-config/hmModules/hyprland/hypr/";
    recursive = true;
  };
}
