return {
  'tpope/vim-fugitive',
  enabled = false,
  lazy = true,
  keys = {
    -- { '<leader>hc', ':G commit -m""<Left>', desc = 'Git commit' },
    { '<leader>hc', ':!git commit -m""<Left>', desc = 'Git commit' },
    -- { '<Leader>hP', '<cmd>G push<CR>', desc = 'Git push' },
    { '<Leader>hP', '<cmd>!git push<CR>', desc = 'Git push' },
    {
      '<Leader>hG',
      function()
        if vim.bo.filetype == 'fugitive' then
          vim.cmd('x')
        else
          vim.cmd('G')
        end
      end,
      desc = 'Git status window',
    },
    -- { '<Leader>hB', '<cmd>G blame<CR>', desc = 'Open Neogit' },
  },
}
