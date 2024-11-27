{...}:

{
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

      # "jp" ='jupyter notebook'
      # "t" ='v -c term'
      # "ca" ='conda activate'
      # "sa" ='source activate'
      # "k" ='zellij'
    };
  };
}
