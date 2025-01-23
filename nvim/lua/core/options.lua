local o = vim.opt

o.number = true
o.relativenumber = true
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8
o.wrap = false
o.termguicolors = true -- set t_Co=256  set term=xterm-256color
o.splitbelow = true
o.splitright = true
o.lazyredraw = true
o.wildmenu = true
o.textwidth = 0
o.sidescroll = 3
o.timeoutlen = 700
o.background = 'dark'
o.clipboard = 'unnamedplus'
o.signcolumn = 'yes'
o.syntax = 'on'
o.fileencoding = 'UTF-8'
o.completeopt = 'menuone,noselect,preview'
o.shortmess:append 'IW' -- disable nvim intro
o.jumpoptions:append 'stack'
o.inccommand = 'split'
o.virtualedit = 'block'
o.spelllang = { 'en', 'pl' }
-- o.spell = true
-- o.colorcolumn = '100'
-- o.undofile = true
-- o.concealcursor = "nc"
-- o.textwidth = 80
-- o.formatoptions:append('t')

o.ruler = false
o.cmdheight = 0
o.showmode = false
o.laststatus = 0
o.showcmdloc = 'tabline'

o.smarttab = true
o.expandtab = true
o.tabstop = 2
o.softtabstop = 0
o.shiftwidth = 0
o.autoindent = true
o.smartindent = true

o.list = true
vim.opt.listchars = {
  trail = '»', -- trailing spaces ▷ ⦿ ➤ ⊙ • ⋙  ⫸  ⇶
  tab = '⫸•', -- tabs »·
  -- space = '·', -- spaces
  -- eol = '↴', -- end of line
  -- extends = '→', -- overflowing text
  -- precedes = '←' -- precedes the window
}
vim.cmd [[highlight Whitespace ctermbg=Brown ctermfg=Black guibg=Brown guifg=Black]]

vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  command = 'set nolist',
})

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set list',
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', { -- :h vim.highlight.on_yank
  callback = function()
    vim.highlight.on_yank({ timeout = 90 }) -- higroup = 'IncSearch'
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_set_hl(0, 'TodoOnHold', { fg = '#A19677' })
vim.api.nvim_set_hl(0, 'TodoUrgent', { fg = '#C7555D' })
vim.api.nvim_set_hl(0, 'TodoDoLater', { fg = '#CE9904' })
vim.api.nvim_set_hl(0, 'TodoKindOfDone', { fg = '#84C41E' }) -- #4D69E3
vim.api.nvim_set_hl(0, 'TodoChecked', { fg = '#6CEA65' })
vim.api.nvim_set_hl(0, 'TodoInProgress', { fg = '#209FBB' })
vim.api.nvim_set_hl(0, 'TodoUnchecked', { fg = '#B07DD9' }) -- Lavender (floral)
-- vim.api.nvim_set_hl(0, 'TodoUnchecked', { fg = '#D9967D' }) -- orangy
vim.api.nvim_set_hl(0, 'TodoUncertain', { fg = '#692CCB' })
-- vim.api.nvim_set_hl(0, 'TodoUncertain', { fg = '#6551E3' })
-- vim.api.nvim_set_hl(0, 'TodoCanceled', { fg = '#808080' })
-- vim.api.nvim_set_hl(0, 'TodoCanceled', { fg = '#AFA3FF' })
vim.api.nvim_set_hl(0, 'TodoCanceled', { fg = '#888889' })

-- 926D09 Bolden Brown
-- 5587C7 Silver Lake Blue
-- 2EBA5A Dark Pastel Green
-- 4E2F8D Tekhelet Dark Purple
-- 209FBB Blue Green
-- 2070BB Azul
-- 692CCB French Violet
-- AA9900 Satin sheen gold
-- 4D69E3 Royal Blue
-- 6CEA65 Screaming Green
-- ACA57D Sage - Creamy
-- 808080 Gray
-- CE9904 Goldenrod
-- 1F04CE Medium blue
-- 6551E3 Majorelle Blue
-- AFA3FF Tropical indigo
-- 888889 Battleship gray
-- B07DD9 Lavender (floral)
