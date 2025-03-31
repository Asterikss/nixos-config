{...}:

{
  fonts.packages = [
    pkgs.nerd-fonts.agave
    pkgs.nerd-fonts.symbols-only
  ];

  # remove proabbly idk
  # fonts.fontconfig.enable = true;
  # remove proabbly idk
  # fonts.enableDefaultPackages = true; # https://medium.com/thelinux/how-to-easily-install-and-configure-fonts-on-nixos-077c52c45718

  fonts.fontconfig.defaultFonts = {
    serif = [ "Agave Nerd Font Propo" ]; # Regular
    sansSerif = [ "Agave Nerd Font" ]; # Regular
    monospace = [ "Agave Nerd Font Mono" ];
    emoji = [ "Symbols Nerd Font" ];
  };
}
