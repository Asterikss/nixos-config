return {
  {
    'navarasu/onedark.nvim',
    enabled = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'deep',
      }
      require('onedark').load()
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({})
      vim.cmd [[colorscheme tokyonight-moon]]
      vim.cmd [[highlight Whitespace ctermbg=Brown ctermfg=Black guibg=Brown guifg=Black]]
    end,
  },
  {
    'savq/melange',
    enabled = false,
  },
  {
    'shatur/neovim-ayu',
    priority = 1000,
    -- enabled = false,
    config = function()
      require('ayu').colorscheme()
      vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = '#82aaff', bold = true })
      vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = '#fca7ea', bold = true })
      vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = '#c3e88d', bold = true })
      vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = '#4fd6be', bold = true })
      vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = '#c099ff', bold = true })
      vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = '#fca7ea', bold = true })
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#204650' })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#2E2C30' })
      vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#E28315' })
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#877C95' }) -- 654D86
      vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#87B4AB', fg = '#000000', bold = true })
      vim.api.nvim_set_hl(0, '@markup.link.label.markdown_inline', { underline = false })
    end,
  },
}
