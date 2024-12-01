return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local nvim_autopairs = require('nvim-autopairs')
    nvim_autopairs.setup({})
    nvim_autopairs.get_rules('"')[1].not_filetypes = { 'lua', 'typescript' }
    nvim_autopairs.get_rules("'")[1].not_filetypes = { 'lua', 'typescript' }
    -- require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    -- local cmp = require("nvim-cmp")
    -- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    -- local cmp = require 'cmp'
    -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
