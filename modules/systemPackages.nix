{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = (
    with pkgs;
    [
      # core
      waybar
      swww
      rofi
      wl-clipboard
      swaynotificationcenter
      libnotify
      brave
      hyprsunset
      pavucontrol
      alsa-utils

      # apps
      swayimg
      vivaldi
      libreoffice
      webcord
      vesktop
      gimp3
      zathura
      firefox

      # utils
      brightnessctl
      zenity
      xarchiver
      overskride
      gcolor3

      # screenshot utils
      grim
      slurp
      swappy
      hyprpicker

      # escape hatch
      distrobox

      # for yazi
      kitty
    ]
  );

  # ++
  #
  #   (with pkgs-stable; [
  #     hello
  #   ])
  #
  # ++
  #
  #   [
  #     inputs.wezterm.packages.${pkgs.system}.default
  #   ];
}
