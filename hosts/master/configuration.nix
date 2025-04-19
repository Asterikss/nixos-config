{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}:

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
    ../../modules/fonts.nix
  ];

  system.stateVersion = "24.05";
}
