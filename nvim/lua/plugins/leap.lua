return {
  'ggandor/leap.nvim',
  keys = { 's' },
  config = function()
    require('leap').create_default_mappings()
    require('leap').opts.case_sensitive = true
  end,
}
