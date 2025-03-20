{...}:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      bind \ch backward-kill-word
      set -x FZF_DEFAULT_OPTS "--bind='ctrl-h:unix-word-rubout'"
      set -x FZF_PREVIEW_OPTS "--preview-window=right:50%:wrap"
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
      "l" = "ls";
      "la" = "ls -A";
      "cc" = "cd ~/cave/";
      "linkd" = "~/.config/scripts/setup_dev.sh";

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

      # "jp" ='jupyter notebook'
      # "t" ='v -c term'
      # "ca" ='conda activate'
      # "sa" ='source activate'
      # "k" ='zellij'
    };
  };
}
