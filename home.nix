{ config, pkgs, ... }:

{
  home.username = "lono";
  home.homeDirectory = "/home/lono";

  programs.git = {
    enable = true;
    userName = "Asterikss";
    userEmail = "AndreAndreM@proton.me";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "master";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      cmd_duration.disabled = true;
      # conda = {
      #   disabled = false;
      #   ignore_base = true;
      #   format = "[$symbol$environment](dimmed green) "
      # }
      # aws.disabled = true;
      # gcloud.disabled = true;
    };
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      bind \ch backward-kill-word
    '';

    functions = {
      c = {
        body = "cd $argv; and ls";
      };
      d = {
        body = "cd ..; and ls";
      };
      gc = ''git commit -m "$argv"'';
    };

    shellAliases = {
      "v" = "nvim";
      "f" = "nvim";
      "h" = "nvim .";
      "S" = "v -S .dev/Session.vim";
      "n" = "nvim .dev/notes.txt";
      "a" = "source ~/.scripts/sessionizer_a";
      "s" = "source ~/.scripts/sessionizer_s";
      "p" = "python3";
      "l" = "ls";
      "cc" = "cd ~/cave/";

      # NixOS
      "reb" = "sudo nixos-rebuild switch --flake ~/cave/nixos-config";

      # Git
      "st" = "git status";
      "ga" = "git add";
      "ga." = "git add .";
      "gp" = "git push";
      "gd" = "git diff";

      # Docker
      "di" = "docker images";
      "dr" = "docker run";
      "db" = "docker build";
      "dp" = "docker ps";
      "dps" = "docker ps -a";
      "drmi" = "docker rmi";
      "drm" = "docker rm";

      # "e" = "explorer.exe .";
      # "jp" ='jupyter notebook'
      # "t" ='v -c term'
      # "config" ='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
      # "ca" ='conda activate'
      # "sa" ='source activate'
      # "k" ='zellij'
    };
  };

  home.file.".config/scripts/screenshot.sh" = {
    text = ''
      #!/usr/bin/env bash

      # Flags:

      # r: region
      # s: screen
      #
      # c: clipboard
      # f: file
      # i: interactive

      # p: pixel

      if [[ $1 == rc ]]; then
        grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | wl-copy
        notify-send 'Copied to Clipboard' Screenshot

      elif [[ $1 == rf ]]; then
        mkdir -p ~/Pictures/Screenshots
        filename=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
        grim -g "$(slurp -b '#000000b0' -c '#00000000')" $filename
        notify-send 'Screenshot Taken' $filename

      elif [[ $1 == ri ]]; then
        grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | swappy -f -

      elif [[ $1 == sc ]]; then
        grim - | wl-copy
        notify-send 'Copied to Clipboard' Screenshot

      elif [[ $1 == sf ]]; then
        mkdir -p ~/Pictures/Screenshots
        filename=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
        grim $filename
        notify-send 'Screenshot Taken' $filename

      elif [[ $1 == si ]]; then
        grim - | swappy -f -

      elif [[ $1 == p ]]; then
        color=$(hyprpicker -a)
        wl-copy $color
        notify-send 'Copied to Clipboard' $color
      fi
    '';
    executable = true;
  };

  home.file.".config/swappy/config" = {
    text = ''
      [Default]
      save_dir=$HOME/Pictures/Screenshots
    '';
  };

  imports = [
    ./modules/neovim
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # neofetch
    # nnn # terminal file manager

    # archives
    # zip
    # xz
    # unzip
    # p7zip

    # # utils
    # ripgrep # recursively searches directories for a regex pattern
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processor https://github.com/mikefarah/yq
    # eza # A modern replacement for ‘ls’
    # fzf # A command-line fuzzy finder

    # # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # # misc
    # cowsay
    # file
    # which
    # tree
    # gnused
    # gnutar
    # gawk
    # zstd
    # gnupg

    # # nix related
    # #
    # # it provides the command `nom` works just like `nix`
    # # with more details log output
    # nix-output-monitor

    # # productivity
    # hugo # static site generator
    # glow # markdown previewer in terminal

    # btop  # replacement of htop/nmon
    # iotop # io monitoring
    # iftop # network monitoring

    # # system call monitoring
    # strace # system call monitoring
    # ltrace # library call monitoring
    # lsof # list open files

    # # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    # pciutils # lspci
    # usbutils # lsusb
  # ];

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  # programs.alacritty = {
  #   enable = true;
  #   # custom settings
  #   settings = {
  #     env.TERM = "xterm-256color";
  #     font = {
  #       size = 12;
  #       draw_bold_text_with_bright_colors = true;
  #     };
  #     scrolling.multiplier = 5;
  #     selection.save_to_clipboard = true;
  #   };
  # };

  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  #   # TODO add your custom bashrc here
  #   bashrcExtra = ''
  #     export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #   '';

  #   # set some aliases, feel free to add more or remove some
  #   shellAliases = {
  #     k = "kubectl";
  #     urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
  #     urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  #   };
  # };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
