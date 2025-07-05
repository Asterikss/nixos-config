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
    ../../modules
    ../../modules/nvidia.nix
  ];

  system.stateVersion = "24.05";
}
