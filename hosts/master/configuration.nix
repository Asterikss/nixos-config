{ config, pkgs, pkgs-stable, inputs, ... }:

{
  networking.hostName = "master";

  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/ly.nix
    ../../modules/fish.nix
    ../../modules/hyprland.nix
    ../../modules/networking.nix
    ../../modules/audio.nix
    ../../modules/nvidia.nix
    ../../modules/hardware.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  environment.systemPackages =
    (with pkgs; [
      brave
      firefox
      vesktop
      gimp
      mpv
      fastfetch
      zathura
      swayimg

      # screenshot utils
      grim
      slurp
      swappy
      hyprpicker

      # hyprland utils
      hyprsunset
      hyprlock

      # utils
      btop
      wget
      overskride
      brightnessctl
      pavucontrol
      fzf
      alsa-utils
      syncthing
      gcolor3

      # fonts
      font-awesome

      # dev
      ripgrep
      black
      fd
      pyright
      lua-language-server
      stylua
      uv
      # rust-analyzer-unwrapped
      # nodejs_22
      # gh

      # build-essential
      cmake
      gnumake
      gcc
    ])
    # gzip
    # tar(1) or gtar(1
    # curl(1) or wget(1)
    # unzip(1

    ++

    (with pkgs-stable; [
      kitty
      rofi-wayland
      waybar
      dunst
      libnotify # dunst depends on it
      swww
      wl-clipboard # for global clipbaord in neovim
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
