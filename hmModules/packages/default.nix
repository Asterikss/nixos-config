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

    # dev
    ripgrep
    fd
    pyright
    lua-language-server
    stylua
    uv
    # rust-analyzer-unwrapped
    # nodejs_22
    # gh

    # build-essential
    cmake
    gnumake
    gcc
  ];
}
