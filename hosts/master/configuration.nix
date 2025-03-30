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
    ../../modules/systemPackages.nix
    ../../modules/virtualisation.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
