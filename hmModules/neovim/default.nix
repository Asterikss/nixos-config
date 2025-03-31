{ config, pkgs, ... }:
let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.python
  ]));

  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = false;

    plugins = [
      treesitterWithGrammars
    ];
  };

  home.file.".config/nvim/" = {
    source = config.lib.file.mkOutOfStoreSymlink
     "${config.home.homeDirectory}/nixos-config/nvim/";
    # source = ../../nvim;
    recursive = true;
  };

  home.file.".config/nvim-treesitter-parsers/nvim-treesitter-parsers.lua".text = ''
    vim.opt.runtimepath:append("${treesitter-parsers}")
  '';

  # Treesitter is configured as a locally developed module in lazy.nvim
  # We put it where lazy.nvim expects locally developed plugins (dev:path)
  home.file."cave/projects/nvim-treesitter/" = {
    source = treesitterWithGrammars;
    recursive = true;
  };
}
