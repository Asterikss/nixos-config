return {
  'tpope/vim-fugitive',
  lazy = true,
  keys = {
    { '<leader>hc', ':G commit -m""<Left>', desc = 'Git commit' },
    { '<Leader>hP', '<cmd>G push<CR>', desc = 'Git push' },
    { '<Leader>hg', function ()
        if vim.bo.filetype == "fugitive" then
          vim.cmd("x")
        else
          vim.cmd("G")
        end
      end, desc = 'Git status window' },
  },
}
