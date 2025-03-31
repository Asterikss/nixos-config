{ pkgs, ... }:

{
  fonts.packages = [
    pkgs.nerd-fonts.agave
    pkgs.nerd-fonts.symbols-only
  ];

  fonts.enableDefaultPackages = true;

  fonts.fontconfig.defaultFonts = {
    serif = [ "Agave Nerd Font Propo" ]; # Regular
    sansSerif = [ "Agave Nerd Font" ]; # Regular
    monospace = [ "Agave Nerd Font Mono" ];
    emoji = [ "Symbols Nerd Font" ];
  };
}
