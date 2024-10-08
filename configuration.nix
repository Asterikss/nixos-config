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

  networking.hostName = "nixos"; # Define your hostname.
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
  hardware.pulseaudio.enable = false;
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
    #   kdePackages.kate
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
  # ######

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # ~~~~~~~~~~~~
  # kitty.enable = true;    # required for the default Hyprland config # https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/

  # Nvidia
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  # Enable OpenGL
  hardware.graphics = { # used to be hardware.opengl it might change again
    enable = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    # https://discourse.nixos.org/t/solved-what-are-the-options-for-hardware-nvidia-package-docs-seem-out-of-date/14251
    # https://nixos.wiki/wiki/Nvidia#CUDA
    # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
    # https://github.com/ryan4yin/nix-config/blob/i3-kickstarter/hosts/msi-rtx4090/default.nix
    # https://discourse.nixos.org/t/issues-with-my-nvidia-gpu-config/35327/2
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    # https://github.com/vimjoyer/nixconf/blob/main/hosts/laptop/included/nvidia.nix
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  # ~~~~~~~~~~~~

  environment.systemPackages =
    (with pkgs; [
       neovim
    ])

    ++

    (with pkgs-stable; [
      kitty
      wezterm
      rofi-wayland
      waybar
      dunst
      libnotify # dunst depends on it
      swww
      brave
      wl-clipboard # for global clipbaord in neovim
    ]);

  #  wget

  # environment.systemPackages = with pkgs-stable; [
  #     kitty
  #         wezterm
  #         neovim
  #         rofi-wayland
  #         waybar
  #         dunst
  #         libnotify # dunst depends on it
  #         swww
  #         brave
  #         wl-clipboard # for global clipbaord in neovim
  #       # git
  #       #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   #  wget
  # ];

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
