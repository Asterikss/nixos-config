{ ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      bind \ch backward-kill-word
      set -x FZF_DEFAULT_OPTS "--bind='ctrl-h:unix-word-rubout'"
      set -x FZF_PREVIEW_OPTS "--preview-window=right:50%:wrap"
      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
      set -x DELTA_PAGER "less --mouse"
      set -x SWWW_TRANSITION_FPS 60
      set -x UV_PYTHON_DOWNLOADS "never"
    '';

    functions = {
      c = ''cd $argv; and ls'';
      d = ''cd ..; and ls'';
      gc = ''git commit -m "$argv"'';
      clone = ''source ~/.config/scripts/clone.fish $argv'';
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rip --force -- "$tmp"
      '';
    };

    shellAliases = {
      "v" = "nvim";
      "f" = "nvim";
      "h" = "nvim .";
      "S" = "v -c 'silent LoadDefatulSession'";
      "n" = "nvim .dev/notes.txt";
      "a" = "source ~/.config/scripts/jump.fish a";
      "s" = "source ~/.config/scripts/jump.fish s";
      "q" = "source ~/.config/scripts/jump.fish q";
      "p" = "python3";
      "l" = "eza --icons=auto";
      "ls" = "eza --icons=auto";
      "la" = "eza -a --icons=auto";
      "lt" = "eza --icons=auto --tree";
      "ll" = "eza -lha --icons=auto --sort=name --group-directories-first";
      "cc" = "cd ~/cave/";
      "cn" = "cd ~/.config/";
      "linkd" = "~/.config/scripts/setup_dev.sh";
      "jp" = "nix develop ~/jupyter_flake";
      "gal" = "swayimg --gallery";
      "gall" = "swayimg --gallery --config='general.size=2200,1000'";

      # NixOS
      "reb" = "sudo nixos-rebuild switch --flake ~/nixos-config";

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

      # "t" ='v -c term'
      # "k" ='zellij'
    };
  };
}
