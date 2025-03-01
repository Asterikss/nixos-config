#!/usr/bin/env fish

if test "$argv[1]" = "a"; or test "$argv[1]" = "s"
  # just dirs -> cd (or nvim . if 's')
  set selected (fd -t d -d 1 . ~/projects ~/cave/ | sed "s|^$HOME/||" | fzf --height 40% --layout reverse --border)
  if test -n "$selected"
    cd "$HOME/$selected"
    if test "$argv[1]" = "s"
      nvim .
    else
      ls
    end
  end
else if test "$argv[1]" = "q"
  # all in vault etc. -> cd into the right folder, nvim <selection>
  set selected (fd . ~/cave/vault/ ~/cave/kkk/ ~/cave/todos/ | sed "s|^$HOME/||" | fzf --height 40% --layout reverse --border)
  if test -n "$selected"
    set full_path "$HOME/$selected"
    # Find the root directory (vault, kkk, or todos)
    set root_dir (echo "$full_path" | grep -oP '(?<=/cave/)(vault|kkk|todos)')
    if test -n "$root_dir"
      cd "$HOME/cave/$root_dir"
      nvim "$full_path"
    end
  end
end
