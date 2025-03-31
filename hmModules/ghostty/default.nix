{...}:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    # programs.ghostty.installVimSyntax = true;
  };

  home.file.".config/ghostty/config" = {
    source = ./config.cfg;
  };

  home.file.".config/ghostty/ghostty_tabs.css" = {
    source = ./ghostty_tabs.css;
  };
}
