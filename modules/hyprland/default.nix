{ config, ... }:

{
  home.file.".config/hypr/hyprland.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/cave/nixos-config/modules/hyprland/hyprland.conf";
  };
}
