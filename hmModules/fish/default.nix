{...}:

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
      '';

    functions = {
      c = {
        body = "cd $argv; and ls";
      };
      d = {
        body = "cd ..; and ls";
      };
      gc = ''git commit -m "$argv"'';
      clone = ''source ~/.config/scripts/clone.fish $argv'';
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
      "linkd" = "~/.config/scripts/setup_dev.sh";
      "rm" = "echo no no noo";
      "jp" = "nix develop ~/jupyter_flake";

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

      # "jp" ='jupyter notebook'
      # "t" ='v -c term'
      # "ca" ='conda activate'
      # "sa" ='source activate'
      # "k" ='zellij'
    };
  };
}
