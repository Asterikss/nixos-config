#!/usr/bin/env fish

if test (count $argv) -lt 1
  echo "Usage: clone <repository-url> [b]"
  return 1
end

set repo_url $argv[1]

set repo_name (basename $repo_url .git)

set target_dir ~/projects/$repo_name/.gitt

git clone --bare $repo_url $target_dir

if test $status -ne 0
  echo "Failed to clone $repo_url"
  return 1
else
  echo "Cloned successfully ($repo_name)"
end

set curr_wtree_file (dirname $target_dir)/.curr_wtree

if test (count $argv) -lt 2
  # If no second argument, add a worktree
  echo "Adding worktree..."
  cd $target_dir
  git worktree add ../master master

  # Check if the worktree command was successful
  if test $status -eq 0
    echo "Worktree added at ../master"
    echo "master" > $curr_wtree_file
  else
    echo "Failed to add worktree"
    return 1
  end
else
  # If the second argument is provided, do nothing (blank mode)
  echo "Blank mode enabled. No worktree added."
  echo "." > $curr_wtree_file
end

cd (dirname $target_dir); and ls
