{
  pkgs,
  pkgs-stable,
  inputs,
  ...
}:

{
  environment.systemPackages =
    (with pkgs; [
      brave
      firefox
      vesktop
      gimp
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
      libnotify
      swww
      nvtopPackages.nvidia
      distrobox
      webcord
      libreoffice
      xarchiver
      zenity
      kitty

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
        hello
      ])

    ++

      [
        inputs.wezterm.packages.${pkgs.system}.default
      ];

    # dive # look into docker image layers
    # podman-tui # status of containers in the terminal
    # docker-compose # start group of containers for dev
    # podman-compose # start group of containers for dev
    # mangohud

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
