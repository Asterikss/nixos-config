{ host, ... }:

{
  networking.hostName = host;

  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  system.stateVersion = "25.05";
}
