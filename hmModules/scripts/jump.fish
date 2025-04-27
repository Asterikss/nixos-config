#!/usr/bin/env fish

if test "$argv[1]" = "a"; or test "$argv[1]" = "s"
  # just dirs -> cd (or nvim . if 's')
  set selected (
    begin
      fd -t d -d 1 . ~/projects ~/cave/
      echo ~/nixos-config/
    end | sed "s|^$HOME/||" | fzf --height 40% --layout reverse --border)
  if test -n "$selected"
    cd "$HOME/$selected"

    # Check if .curr_wtree exists and cd into the directory specified in it
    if test -f ".curr_wtree"
      set wtree_dir (cat .curr_wtree | string trim)
      if test -n "$wtree_dir" -a -d "$wtree_dir"
        cd "$wtree_dir"
      end
    end

    if test "$argv[1]" = "s"
      nvim .
    else
      ls
    end
  end
else if test "$argv[1]" = "q"
  # all in vault etc. -> cd into the right folder, nvim <selection>
  set selected (fd -t f . ~/cave/vault/ ~/cave/kkk/ | sed "s|^$HOME/||" | fzf --height 40% --layout reverse --border)
  if test -n "$selected"
    set full_path "$HOME/$selected"
    # Find the root directory (vault, kkk, or todos)
    set root_dir (echo "$full_path" | grep -oP '(?<=/cave/)(vault|kkk)')
    if test -n "$root_dir"
      cd "$HOME/cave/$root_dir"
      nvim "$full_path"
    end
  end
end
