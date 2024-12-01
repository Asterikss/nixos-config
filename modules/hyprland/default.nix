{ config, ... }:

{
  home.file.".config/hypr/" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/cave/nixos-config/modules/hyprland/hypr/";
    recursive = true;
  };
}
