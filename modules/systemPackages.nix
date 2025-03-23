{ pkgs, pkgs-stable, inputs, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      brave
      firefox
      vesktop
      gimp
      mpv
      zathura
      swayimg
      kdePackages.dolphin
      hyprsunset
      rofi-wayland
      waybar
      wl-clipboard
      gcolor3
      overskride
      swaynotificationcenter
      swww

      # screenshot utils
      grim
      slurp
      swappy
      hyprpicker

      # utils
      brightnessctl
      alsa-utils
      pavucontrol

      # fonts
      font-awesome
    ])

    ++

    (with pkgs-stable; [
      kitty
      dunst
      libnotify # dunst depends on it
    ])

    ++

    [
      inputs.wezterm.packages.${pkgs.system}.default
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
