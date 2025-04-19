return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  keys = {
    { '<Leader>hg', '<cmd>Neogit<CR>', desc = 'Open Neogit' },
    -- { '<Leader>hP', '<cmd>Neogit push<CR>', desc = 'Neogit push' },
    -- { '<Leader>hpp', '<cmd>Neogit pull<CR>', desc = 'Neogit pull' },
  },
  config = {
    prompt_force_push = false,
    rebase_editor = {
      popup = {
        ['X'] = false,
      },
      status = {
        ['x'] = false,
      },
    },
  },
}
