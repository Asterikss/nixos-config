{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # utils
    rip2
    btop
    wget
    unzip
    fzf
    fastfetch
    syncthing
    bat
    eza
    tree
    tokei
    jq
    ripgrep
    fd
    calcurse

    # dev
    pyright
    lua-language-server
    stylua
    uv
    nixfmt-rfc-style
    # rust-analyzer-unwrapped
    # nodejs_22
    # gh
    # quarto

    # build-essential
    cmake
    gnumake
    gcc
  ];
}
