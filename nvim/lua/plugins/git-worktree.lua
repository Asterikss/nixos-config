return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    {
      '<Leader>ww',
      mode = 'n',
      function()
        require('telescope').extensions.git_worktree.git_worktrees()
      end,
      desc = 'git-worktrees',
    },
    {
      '<Leader>wW',
      mode = 'n',
      function()
        require('telescope').extensions.git_worktree.create_git_worktree()
      end,
      desc = 'git-worktree create',
    },
  },
  config = function()
    require('telescope').load_extension('git_worktree')
    local Worktree = require('git-worktree')
    -- op = Operations.Switch, Operations.Create, Operations.Delete
    -- metadata = table of useful values (structure dependent on op)
    --      Switch
    --          path = path you switched to
    --          prev_path = previous worktree path
    --      Create
    --          path = path where worktree created
    --          branch = branch name
    --          upstream = upstream remote name
    --      Delete
    --          path = path where worktree deleted
    Worktree.on_tree_change(function(op, metadata)
      if op == Worktree.Operations.Switch then
        -- print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
        if vim.bo.filetype == 'oil' then
          vim.cmd('normal _')
        end
      end
    end)
  end,
}
