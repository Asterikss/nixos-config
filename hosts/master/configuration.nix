# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-stable, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "master"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # hardware.pulseaudio.enable = false;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lono = {
    isNormalUser = true;
    description = "lono";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [
    #  kdePackages.kate
    #  thunderbird
    # ];
  };

  # Install firefox.
  # programs.firefox.enable = true;
  programs.firefox = {
    enable = true;
    package = pkgs-stable.firefox;
  };

  # ######
  # programs.hyprland.enable = true;
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true; # Depriciated, no longer needed
    # package = pkgs-stable.hyprland;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware.bluetooth.enable = true;

 # hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot # https://nixos.wiki/wiki/Bluetooth

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fuck Nvidia
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  # Enable OpenGL
  hardware.graphics = { # used to be hardware.opengl, it might change again
    enable = true;
  };
  hardware.nvidia = {
    # open = false;
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;
    # powerManagement.enable = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    # package = config.boot.kernelPackages.nvidiaPackages.production;
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "555.58.02";
    #   sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
    #   sha256_aarch64 = "sha256-wb20isMrRg8PeQBU96lWJzBMkjfySAUaqt4EgZnhyF8=";
    #   openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
    #   settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
    #   persistencedSha256 = "sha256-a1D7ZZmcKFWfPjjH1REqPM5j/YLWKnbkP9qfRyIyxAw=";
    # };
    package = config.boot.kernelPackages.nvidiaPackages.latest;

    # fuck nvidia
    # package = let
    #     rcu_patch = pkgs.fetchpatch {
    #         url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
    #         hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
    #     };
    # in config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #     # version = "550.40.07";
    #     # sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
    #     # sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
    #     # openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
    #     # settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
    #     # persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
    #
    #     # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #     version = "555.58.02";
    #     sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
    #     sha256_aarch64 = "sha256-wb20isMrRg8PeQBU96lWJzBMkjfySAUaqt4EgZnhyF8=";
    #     openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
    #     settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
    #     persistencedSha256 = "sha256-a1D7ZZmcKFWfPjjH1REqPM5j/YLWKnbkP9qfRyIyxAw=";
    #     # };
    #
    #     # version = "535.154.05";
    #     # sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
    #     # sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
    #     # openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
    #     # settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
    #     # persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
    #
    #     patches = [ rcu_patch ];
    # };

    # https://discourse.nixos.org/t/solved-what-are-the-options-for-hardware-nvidia-package-docs-seem-out-of-date/14251
    # https://nixos.wiki/wiki/Nvidia#CUDA
    # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
    # https://github.com/ryan4yin/nix-config/blob/i3-kickstarter/hosts/msi-rtx4090/default.nix
    # https://discourse.nixos.org/t/nvidia-4070-super-requires-a-specific-driver/38830
    # https://discourse.nixos.org/t/issues-with-my-nvidia-gpu-config/35327/2
    # https://github.com/vimjoyer/nixconf/blob/main/hosts/laptop/included/nvidia.nix
    # https://discourse.nixos.org/t/nvidia-4070-super-requires-a-specific-driver/38830
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/nvidia-x11/default.nix
    # https://discourse.nixos.org/t/builder-for-nvidia-x11-550-78-6-10-drv-failed-with-exit-code-2/49360/
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  programs.fish.enable = true;

  # https://discourse.nixos.org/t/how-to-create-files-in-the-etc-udev-rules-d-directory/11929
  # https://github.com/zsa/wally/wiki/Linux-install#2-create-a-udev-rule-file
  hardware.keyboard.zsa.enable = true;

  # programs.neovim.enable = true;

  environment.systemPackages =
    (with pkgs; [
      brave
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
      rip2

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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
