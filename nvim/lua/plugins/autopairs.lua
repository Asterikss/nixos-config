return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local nvim_autopairs = require('nvim-autopairs')
    nvim_autopairs.setup({})
    -- require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    nvim_autopairs.get_rules('"')[1].not_filetypes = { 'lua', 'typescript' }
    nvim_autopairs.get_rules("'")[1].not_filetypes = { 'lua', 'typescript' }
  end,
}
